require "rails_helper"

RSpec.feature "New entry user flow", :type => :feature do
  scenario "A user sees correct prepopulated fields on entry page" do
    VCR.use_cassette("new_entry_ux_flow") do
      visit root_path
      click_on "Login with Facebook"

      click_on "Create New Entry"

      expect(page).to have_field("Date", with: (Date.today.strftime("%Y-%m-%d")))
      expect(page).to have_field("Meal")
      expect(page).to have_field("Ingredients", with: "")
      expect(page).to have_field("Notes", with: "")

      visit dashboard_path
      click_on "Create New Entry"
      fill_in "Date", with: Date.today
      select "Breakfast", from: "Meal"
      fill_in "Ingredients", with: "2 eggs, 4oz bacon"
      fill_in "Notes", with: "Nom nom nom"
      click_on "SAVE"

      expect(current_path).to eq(dashboard_path)

      # within "td.meal-column" do
      #   first(:link, "+").click
      # end
      #
      # expect(page).to have_field("Date", with: (Date.today.strftime("%Y-%m-%d")))
      # expect(page).to have_field("Meal", with: "Lunch")
      # expect(page).to have_field("Ingredients", with: "")
      # expect(page).to have_field("Notes", with: "")
    end
  end
end
