require 'spec_helper'

RSpec.feature "Pages", :type => :feature do
  before :each do
    Capybara.default_driver = :selenium
  end

  scenario "Visiting the home page with no signatures", :js => true do
    visit "/"
    expect(page).to have_content "Be the first!"
    # TODO: make this test repsond to the javascript updates that should take place
    # when signatures are created
    # Problem: I believe 'transactional fixtures' don't work in selenium tests
    # So I'll need to navigate in order to create any database records...
  end
end
