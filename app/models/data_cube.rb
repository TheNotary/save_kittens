class DataCube

  def self.push_fresh_data(d)
    push_data "/save_kittens/data/fresh_data", d
  end

  def self.push_data(channel, msg)
    begin
      message = {:channel => channel, :data => msg, :ext => {:authToken => ENV['SAVE_KITTENS_FAYE_TOKEN']}}
      uri = URI.parse("http://localhost:8000/faye")
      Net::HTTP.post_form(uri, :message => message.to_json)
    rescue # faye server must be offline. Oh well.
    end
  end

end
