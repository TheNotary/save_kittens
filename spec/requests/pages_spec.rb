require 'spec_helper'

describe "Pages" do

  describe "GET /" do
    it "Works!" do
      get "/"
      expect(response.status).to be(200)
    end

    it "Shouldn't have errors pluralizing any of the data" do
      get "/"
      expect(response.body).to include("members")
    end
  end

end
