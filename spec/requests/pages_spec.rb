require 'spec_helper'

describe "Pages" do

  describe "GET /" do

    it "Works!" do
      get "/"
      expect(response.status).to be(200)
    end



  end

end
