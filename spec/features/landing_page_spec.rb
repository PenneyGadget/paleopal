require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  scenario "User creates a new widget" do
    visit "/widgets/new"

    fill_in "Name", :with => "My Widget"
    click_button "Create Widget"

    expect(page).to have_text("Widget was successfully created.")
  end
end

# As a user
# When I visit the root page
# I see a black and white image
# The words 'PaleoPal' fade in
# And I see "Login with Facebook"
# And I see a few lines of text about the site
# And when I hover my mouse color fills in the photo
