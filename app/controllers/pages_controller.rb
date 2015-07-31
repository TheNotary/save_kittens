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
    # These gon assignments can cause bugs because if you start on the admin
    # page, and then turbo link to home, gon won't be set properly...
    gon.topThreeStates = @t
    gon.signatureCount = @signature_count
    @first_state = @t[0]
    @second_state = @t[1]
    @third_state = @t[2]
  end

  def about
  end

  def admin
    admins_only!

    @total_signers = Signature.count
    @signatures_this_week = Signature.this_week.count
    @signatures_today = Signature.today.count
    @signatures_this_hour = Signature.this_hour.count
    @growth_today = Signature.growth_today

    gon.signaturesByDayThisWeek = Signature.by_day_this_week
  end
end
