require "rails_helper"

RSpec.feature "User dashboard", :type => :feature do
  scenario "Totals column sums all meals" do
    VCR.use_cassette("dasboard_totals_column") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/03/2016"
      select "Breakfast", from: "Meal"
      fill_in "Ingredients", with: "2 eggs, 4oz bacon"
      fill_in "Notes", with: "My first food diary entry!"
      click_on "SAVE"
      save_and_open_page
      click_on "Create New Entry"
      fill_in "Date", with: "03/03/2016"
      select "Lunch", from: "Meal"
      fill_in "Ingredients", with: "2oz spinach, 4oz chicken"
      fill_in "Notes", with: "I'm so healthy!"
      click_on "SAVE"

      expect(page).to have_css("td.breakfast-column", text: "Fat: 54g")
      expect(page).to have_css("td.breakfast-column", text: "Carbs: 1g")
      expect(page).to have_css("td.breakfast-column", text: "Protein: 26g")

      expect(page).to have_css("td.lunch-column", text: "Fat: 17g")
      expect(page).to have_css("td.lunch-column", text: "Carbs: 2g")
      expect(page).to have_css("td.lunch-column", text: "Protein: 22g")

      expect(page).to have_css("td.totals-column", text: "Fat: 71g")
      expect(page).to have_css("td.totals-column", text: "Carbs: 3g")
      expect(page).to have_css("td.totals-column", text: "Protein: 48g")
    end
  end
end
