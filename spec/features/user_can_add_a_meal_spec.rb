require "rails_helper"

RSpec.feature "New entries page", :type => :feature do
  scenario "A user can add a meal and see it on their dashboard" do
    VCR.use_cassette("entries#new-meal") do
      visit root_path
      click_on "Login with Facebook"
      visit new_entry_path

      fill_in "Date", with: "03/03/2016"
      find("select#entry-meal").select("Breakfast")
      fill_in "Ingredients", with: "2 eggs, 4oz bacon, 12oz coffee"
      fill_in "Notes", with: "My first food diary entry!"
      click_on "SAVE"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("New meal logged!")
      expect(page).to have_content("Thu Mar 3, 2016")
      expect(page).to have_content("Fat: 54g")
      expect(page).to have_content("Carbs: 2g")
      expect(page).to have_content("Protein: 27g")
    end
  end

  scenario "User sees an error if they do not enter required field" do
    visit root_path
    click_on "Login with Facebook"
    visit new_entry_path

    fill_in "Date", with: ""
    find("select#entry-meal").select("Breakfast")
    fill_in "Ingredients", with: ""
    fill_in "Notes", with: "Blarg"
    click_on "SAVE"

    expect(current_path).to eq(new_entry_path)
    expect(page).to have_content("Date can't be blank, Ingredients can't be blank")
  end
end
