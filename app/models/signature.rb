class Signature < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { message: "The email provided has already signed the petition" }
  validates :name, presence: true
  validates :zip, presence: true

  before_save :setup_state
  after_save :cache_signature_data_and_server
  after_destroy :invalidate_cache

  def setup_state
    self.state = self.zip.to_region(state:true) if state.nil?
  end

  # after a new signature is created, publish fresh data to the clients
  # and also set the cache value that /fresh_data is based upon
  def cache_signature_data_and_server
    invalidate_cache
    Rails.cache.write("topThreeStates", self.class.top_three_states, expires_in: 10.minutes)
    Rails.cache.write("signatureCount", self.class.count, expires_in: 10.minutes)
    self.class.update_clients
  end

  def invalidate_cache
    Rails.cache.write("topThreeStates", nil)
    Rails.cache.write("signatureCount", nil)
  end

  # json api
  def self.fresh_data
    { signatureCount: self.cached_count,
      topThreeStates: self.top_three_states }
  end

  # json api
  def self.by_day_this_week
    data = []
    6.downto(0) do |i|
      day_name = i.days.ago.utc.strftime("%A")
      count = records_from_x_days_ago(i).count
      data << { Day: day_name, Signatures: count}
    end
    data
  end

  def self.cached_count
    Rails.cache.read("signatureCount") or self.count
  end

  # sends a message to all clients indcating the
  # Signature.count and the top_three_states
  def self.update_clients
    # only allow full :js tests to use the websockets
    unless (Rails.env == "test" and Capybara.current_driver != Capybara.javascript_driver)
      DataCube.push_fresh_data(Signature.fresh_data)
    end
  end


  # Efficiently grabs top three states for ajaxing or what have you
  # and utilizes caching since there's polling going on which really adds up
  # on server CPU time fast.
  def self.top_three_states
    cached_top_three = Rails.cache.read("topThreeStates")
    if cached_top_three.nil?
      a = Signature.select(:state).group(:state).order("count(state) DESC").limit(3)

      top3 = a.map { |query| query.state }
      Rails.cache.write("topThreeStates", top3)

      top3
    else
      cached_top_three
    end
  end

  scope :this_week, -> { where("created_at >= ?", 7.days.ago.utc) }
  scope :today, -> { where("created_at >= ?", 1.day.ago.utc) }
  scope :yesterday, -> { where(:created_at => 2.days.ago.utc..1.day.ago.utc) }
  scope :this_hour, -> { where("created_at >= ?", 1.hour.ago.utc) }

  def self.records_from_x_days_ago(n)
    self.where(:created_at => (n+1).days.ago.utc..n.day.ago.utc)
  end

  def self.growth_today
    return "N/A (calculation requires yesterday to have signatures)" if self.yesterday.count == 0
    plus_sign = today.count >= yesterday.count ? "+" : ""
    growth_decimal = (today.count - yesterday.count) / yesterday.count
    percent_text = plus_sign + (growth_decimal * 100).to_s + "%"
    element_class = plus_sign.empty? ? "decline" : "growth"
    "<span class='#{element_class}'>#{percent_text}</span>".html_safe
  end



  # State with most sigs... for tests only really
  def self.first_state
    top_three_states[0]
  end

  # State with second-most sigs... for tests only really
  def self.second_state
    top_three_states[1]
  end

  # State with third-most sigs... for tests only really
  def self.third_state
    top_three_states[2]
  end
end
