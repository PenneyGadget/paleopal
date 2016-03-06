require "rails_helper"

RSpec.feature "Landing page", :type => :feature do
  scenario "User visits root page" do
    visit root_path

    expect(page).to have_text("PaleoPal")
    expect(page).to have_link("Login with Facebook")
    expect(page).to have_css("div.user-buttons")
    expect(page).to have_css("div.tagline")
  end

  scenario "User scrolls down landing page" do
    visit root_path

    expect(page).to have_css("div.testimonials")
    expect(page).to have_text("OUR USERS LOVE US...")
    expect(page).to have_text("How Does it Work?")
    expect(page).to have_css("div.how-it-works")
    expect(page).to have_css("div.screenshots")
    expect(page).to have_link("Login with Facebook")
    expect(page).to have_text("Check out all of our great Paleo resources")
    expect(page).to have_link("here")
  end
end
