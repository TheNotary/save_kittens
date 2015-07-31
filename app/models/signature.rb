class Signature < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { message: "The email provided has already signed the petition" }
  validates :name, presence: true
  validates :zip, presence: true

  before_save :setup_state

  def setup_state
    self.state = self.zip.to_region(state:true) if state.nil?
    update_clients
  end

  def self.to_json
    { signatureCount: self.count,
      topThreeStates: self.top_three_states }.to_json
  end

  # sends a signal to all clients indcating Signature.count and the
  # top_three_states
  def update_clients
    # TODO: Implement me
  end

  # Efficiently grabs top three states for ajaxing or what have you
  def self.top_three_states
    a = Signature.select(:state).group(:state).order("count(state) DESC").limit(3)

    a.map { |query| query.state }
  end

  scope :this_week, -> { where("created_at >= ?", 7.days.ago.utc) }
  scope :today, -> { where("created_at >= ?", 1.day.ago.utc) }
  scope :yesterday, -> { where(:created_at => 2.days.ago.utc..1.day.ago.utc) }
  scope :this_hour, -> { where("created_at >= ?", 1.hour.ago.utc) }

  def self.growth_today
    return "N/A (calculation requires yesterday to have signatures)"
    (self.today.count - self.yesterday.count) / self.yesterday.count * 100
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
