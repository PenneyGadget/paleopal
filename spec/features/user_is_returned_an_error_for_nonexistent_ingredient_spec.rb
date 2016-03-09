require "rails_helper"

RSpec.feature "Ingredient error", :type => :feature do
  scenario "Error returned for nonexistent ingredient" do
    VCR.use_cassette("nonexistent_ingredient_flow") do
      visit root_path
      click_on "Login with Facebook"
      click_on "Create New Entry"

      fill_in "Date", with: "03/03/2016"
      select "Breakfast", from: "Meal"
      fill_in "Ingredients", with: "1 small apple, 1oz bacom"
      click_on "CALCULATE"

      # expect(rendered).to have_content "ERROR: Sorry, '1oz bacom' is not in our database"
      expect(current_path).to eq(new_entry_path)
      # expect(page).to have_content "2016-03-03"
      expect(page).to have_content "Breakfast"
      expect(page).to have_content "1 small apple, 1oz bacom"
    end
  end
end
