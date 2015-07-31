require 'spec_helper'

describe "Pages" do
  
  before(:each) do
    Rails.cache.clear
  end

  describe "GET /data/fresh_data" do

    it "Returns expected values for nil input!" do
      get "/data/fresh_data"
      expect(response.status).to be(200)
      d = JSON.parse(response.body)

      expect(d["signatureCount"]).to eq 0
      expect(d["topThreeStates"]).to eq []
    end

    it "Returns expected values as input is delivered" do
      # set's an initial state so topThreeStates displays
      FactoryGirl.create(:signature, zip: '94080')
      FactoryGirl.create(:signature, zip: '94080')
      FactoryGirl.create(:signature, zip: '94080')

      FactoryGirl.create(:signature, zip: '55331')
      FactoryGirl.create(:signature, zip: '55331')

      FactoryGirl.create(:signature, zip: '11211')

      get "/data/fresh_data"
      d = JSON.parse(response.body)



      # Verify that when a 3rd place state get's the most signatures, it gets
      # bumped up in rank properly
      expect(d["signatureCount"]).to eq 6
      expect(d["topThreeStates"]).to eq ["CA", "MN", "NY"]


      FactoryGirl.create(:signature, zip: '11211')
      FactoryGirl.create(:signature, zip: '11211')
      FactoryGirl.create(:signature, zip: '11211')

      get "/data/fresh_data"
      d = JSON.parse(response.body)

      expect(d["signatureCount"]).to eq 9
      expect(d["topThreeStates"]).to eq ["NY", "CA", "MN"]
    end

  end
end
