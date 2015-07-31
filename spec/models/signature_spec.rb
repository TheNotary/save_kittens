require 'spec_helper'

describe "Signature" do

  before(:each) do
    Rails.cache.clear
  end

  it "should create a new instance given a valid attribute" do
    s = FactoryGirl.create(:signature, zip: "11211")
    expect(s.state).to eq "NY"
    expect(Signature.first_state).to eq "NY"
  end

  it "should be able to determine the top 3 states" do
    expect(Signature.first_state).to be nil

    s = FactoryGirl.create(:signature, zip: "11211")

    expect(Signature.first_state).to eq "NY"
    expect(Signature.second_state).to be nil

    2.times do
      FactoryGirl.create(:signature, zip: "55331")
    end

    expect(Signature.first_state).to eq "MN"

    3.times do
      FactoryGirl.create(:signature, zip: "94080")
    end

    expect(Signature.first_state).to eq "CA"
    expect(Signature.second_state).to eq "MN"
    expect(Signature.third_state).to eq "NY"
  end



end
