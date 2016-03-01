require "rails_helper"

RSpec.feature "Landing page", :type => :feature do
  scenario "User visits root page" do
    visit root_path

    expect(page).to have_text("PaleoPal")
    expect(page).to have_link("Login with Facebook")
    expect(page).to have_css("div.user-info")
    # expect(page).to have_text("some info")
  end

  # scenario "User scrolls down landing page" do
  #   visit root_path
  #
  #   expect(page).to have_css("#user-testimonials")
  #   expect(page).to have_text("How it Works")
  #   expect(page).to have_css("#how-it-works")
  #   expect(page).to have_css(".screenshots")
  #   expect(page).to have_button("Login with Facebook")
  # end
end
