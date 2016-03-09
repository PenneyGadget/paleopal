require "rails_helper"

RSpec.feature "Edit a meal", :type => :feature do
  scenario "A user can edit one of their meals" do
    VCR.use_cassette("edit_meal_entry") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/03/2016"
      select "Breakfast", from: "Meal"
      fill_in "Ingredients", with: "2 eggs, 4oz bacon"
      fill_in "Notes", with: "My first food diary entry!"
      click_on "SAVE"

      visit dashboard_path
      click_on "View Entry"
      click_on "Edit this Entry"

      fill_in "Ingredients", with: "2 eggs, 4oz bacon, 12oz coffee"
      fill_in "Notes", with: "Forgot to add my coffee!"
      click_on "UPDATE MEAL"

      expect(current_path).to eq(entry_path(Entry.last.id))
      expect(page).to have_content("Breakfast for Thu Mar 3, 2016")
      expect(page).to have_content("2 eggs, 4oz bacon, 12oz coffee")
      expect(page).to have_content("Forgot to add my coffee!")
    end
  end
end
