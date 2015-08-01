require 'spec_helper'

RSpec.feature "Pages", :type => :feature do
  before :each do
    Capybara.default_driver = :selenium
    populate_database
  end

  scenario "The admin can login to the admin page", :js => true do
    visit "/"
    click_link "Login"

    fill_in "user_email", with: "admin@eff.org"
    fill_in "user_password", with: "#{ENV["CATS_ADMIN_PASSWORD"]}"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")

    click_link "Admin Page"
    expect(page).to have_content("Last 7 Days")
  end

  scenario "Visiting the home page with no signatures", :js => true do
    visit "/"
    expect(page).to have_content "We've had 0 signatures so far. Be the first!"
  end

  scenario "shouldn't fail to load javascript when going from /thank_you back to /", :js => true do
    visit "/"
    # javascript will hide this with a Sig count of 0
    expect(page).not_to have_content "The top "

    visit "/thank_you"

    visit "/"
    # javascript will hide this with a Sig count of 0
    expect(page).not_to have_content "The top "
  end

  scenario "The user should be able to sign", :js => true do
    visit "/"

    fill_in "signature_name", with: "john smith"
    fill_in "signature_email", with: "a@b"
    fill_in "signature_zip", with: "90210"
    click_button "Sign!"

    expect(page).to have_content "important"

    expect(Signature.count).to eq 1
  end

  scenario "The user starts making more signatures and sees the correct pluralizations", :js => true do
    visit "/"
    expect(page).to have_content "We've had 0 signatures so far. Be the first!"

    $FINAL_LAP = true

    FactoryGirl.create(:signature, zip: "90210")


    # the webdriver automatically waits for any outstanding javascript intervals to tick???
    #sleep 3
    expect(page).not_to have_content "Be the first!"
    expect(page).to have_content "We've had 1 signature so far."
    expect(page).to have_content "The top 1 most committed state is..."
    expect(page).to have_content "CA"

    FactoryGirl.create(:signature, zip: "90210")
    expect(page).to have_content "We've had 2 signatures so far."
    expect(page).to have_content "The top 1 most committed state is..."

    FactoryGirl.create(:signature, zip: "55331")
    expect(page).to have_content "We've had 3 signatures so far."
    expect(page).to have_content "The top 2 most committed states are..."
    expect(page).to have_content "MN"

    FactoryGirl.create(:signature, zip: "60653")
    expect(page).to have_content "We've had 4 signatures so far."
    expect(page).to have_content "The top 3 most committed states are..."
    expect(page).to have_content "MN"
    expect(page).to have_content "CA"
    expect(page).to have_content "IL"



  end

end
