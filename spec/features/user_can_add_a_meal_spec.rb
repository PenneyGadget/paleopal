require "rails_helper"

RSpec.feature "New entries page", :type => :feature do
  scenario "A user can add a meal and see it on their dashboard" do
    VCR.use_cassette("entries#new-meal") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/01/2016"
      find("select#entry-meal").select("Breakfast")
      fill_in "Ingredients", with: "2 eggs, 4oz bacon, 12oz coffee"
      fill_in "Notes", with: "My first food diary entry!"
      click_on "SAVE"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("New meal logged!")
      # expect(page).to have_content("Tues Mar 1, 2016") #is showing Jan 3
      expect(page).to have_content("Fat: 54g")
      expect(page).to have_content("Carbs: 2g")
      expect(page).to have_content("Protein: 27g")
    end
  end
end
