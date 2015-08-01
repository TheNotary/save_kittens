FAYE_TOKEN = 'secretasdfasdf'
class DataCube

  def self.push_fresh_data(d)
    push_data "/save_kittens/fresh_data", d
  end

  def self.push_data(channel, msg)
    # binding.pry
    message = {:channel => channel, :data => msg, :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:8000/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
