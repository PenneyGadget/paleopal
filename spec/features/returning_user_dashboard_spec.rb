require "rails_helper"

RSpec.feature "New entries page", :type => :feature do
  scenario "A returning user can see past entries" do
    VCR.use_cassette("view#past#entries") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/02/2016"
      find("select#entry-meal").select("Breakfast")
      fill_in "Ingredients", with: "2 eggs"
      fill_in "Notes", with: "My first food diary entry!"
      click_on "SAVE"

      click_on "Create New Entry"
      fill_in "Date", with: "03/03/2016"
      find("select#entry-meal").select("Snack")
      fill_in "Ingredients", with: "2oz almonds"
      fill_in "Notes", with: "My second food diary entry!"
      click_on "SAVE"

      # click_on "Logout"
      # visit root_path
      # click_on "Login with Facebook"
      visit dashboard_path
      save_and_open_page
      expect(page).to have_content("Thu Mar 3, 2016")
      expect(page).to have_css("td.snack-column", text: "Fat: 28g")
      expect(page).to have_css("td.snack-column", text: "Carbs: 12g")
      expect(page).to have_css("td.snack-column", text: "Protein: 11g")

      # expect(page).to have_content("Wed Mar 2, 2016")
      expect(page).to have_css("td.breakfast-column", text: "Fat: 9g")
      expect(page).to have_css("td.breakfast-column", text: "Carbs: 0g")
      expect(page).to have_css("td.breakfast-column", text: "Protein: 12g")
    end
  end
end
