require "rails_helper"

RSpec.feature "Delete a meal", :type => :feature do
  scenario "A user can delete one of their meals" do
    VCR.use_cassette("delete_meal_entry") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/03/2016"
      select "Breakfast", from: "Meal"
      fill_in "Ingredients", with: "2 eggs"
      fill_in "Notes", with: "Foodstuffs!"
      click_on "SAVE"

      visit dashboard_path
      click_on "View Entry"
      click_on "Delete Entry"

      expect(current_path).to eq(dashboard_path)
      expect(page).to_not have_content("Thu Mar 3, 2016")
    end
  end
end
