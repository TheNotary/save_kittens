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

    # begin
    #   # we're not validating the fayecom with ssl
    #   prev_setting = OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
    #   OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)
    #
    #   message = {:channel => channel, :data => msg, :ext => {:authToken => ENV['SAVE_KITTENS_FAYE_TOKEN']}}
    #   uri = URI.parse("https://localhost:8001/faye")
    #   Net::HTTP.post_form(uri, :message => message.to_json)
    # rescue
    # ensure
    #   OpenSSL::SSL.send(:remove_const, :VERIFY_PEER)
    #   OpenSSL::SSL.const_set(:VERIFY_PEER, prev_setting)
    # end

  end

end
