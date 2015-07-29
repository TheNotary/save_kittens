class PagesController < ApplicationController
  def home

    @twitter_card = TwitterCard.new(
      header: "Stop the Cat Grabbers!",
      body: "Cats are about to be banned from the internet by a bunch of people who don't know how the internet works! ",
      img: "images/Sad-Cat-1_s.jpg",
      url: "").render

    @google_card = GoogleCard.new(
      header: "Stop the Cat Grabbers!",
      body: "Cats are about to be banned from the internet by a bunch of people who don't know how the internet works! ",
      img: "images/Sad-Cat-1_s.jpg",
      url: "").render


    @signature = Signature.new
    @signature_count = Signature.count
    @t = Signature.top_three_states
    gon.topThreeStates = @t
    gon.signatureCount = @signature_count
    @first_state = @t[0]
    @second_state = @t[1]
    @third_state = @t[2]
  end

  def about
  end
end
