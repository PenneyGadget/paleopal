require "rails_helper"

RSpec.feature "Dashboard page", :type => :feature do
  scenario "New user visits their dashboard for the first time" do
    visit root_path
    click_on("Login with Facebook")

    expect(page).to have_text("Create New Entry")
    expect(page).to have_css("table.entries-table")
    expect(page).to have_text("DATE")
    expect(page).to have_text("BREAKFAST")
    expect(page).to have_text("LUNCH")
    expect(page).to have_text("DINNER")
    expect(page).to have_text("SNACKS")
    expect(page).to have_text("TOTALS")
    expect(page).to have_link("+")
    expect(page).to have_css("nav.navbar-fixed-top")
    expect(page).to have_link("Profile")
    expect(page).to have_link("Dashboard")
    expect(page).to have_link("Logout")
  end
end
