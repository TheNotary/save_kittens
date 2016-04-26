class DataCube

  def self.push_fresh_data(d)
    push_data "/save_kittens/data/fresh_data", d
  end

  def self.fayecom_url
    "#{ENV['fayecom_protocol']}://#{ENV['fayecom_address']}:#{ENV['fayecom_port']}/faye"
  end

  def self.push_data(channel, msg)
    message = {:channel => channel, :data => msg, :ext => {:authToken => ENV['faye_auth_token']}}
    uri = URI.parse(fayecom_url)

    begin
      Net::HTTP.post_form(uri, message: message.to_json)
    rescue Errno::ECONNREFUSED => e
      puts "ERROR:  Could not send message to Faye server.  Is it offline? #{fayecom_url}"
    rescue OpenSSL::SSL::SSLError => e
      puts "WARNING:  Not SSL verifying host... this could be a big deal... #{fayecom_url}"
      OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
      OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
      Net::HTTP.post_form(uri, message: message.to_json)
    ensure
      OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
      OpenSSL::SSL.const_set(:VERIFY_PEER, 1)
    end

  end

end
