require 'spec_helper'

describe "Pages" do

  describe "GET /" do

    it "Works!" do
      get "/"
      expect(response.status).to be(200)
    end

    it "It has javascript that can update" do |member|

    end

  end

end
