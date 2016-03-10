require "rails_helper"

RSpec.feature "Dashboard page", :type => :feature do
  scenario "New user visits their dashboard for the first time" do
    visit root_path
    click_on("Login with Facebook")

    expect(page).to have_text("Welcome Penney Gadget!")
    expect(page).to have_text("Create New Entry")
    expect(page).to have_text("Welcome to PaleoPal!")
    expect(page).to have_text("You don't have any meals entered. Click \"Create a New Entry\" above to get started")
    expect(page).to have_css("nav.navbar-fixed-top")
    expect(page).to have_link("Profile")
    expect(page).to have_link("Dashboard")
    expect(page).to have_link("Logout")
  end
end
