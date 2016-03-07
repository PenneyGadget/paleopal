require "rails_helper"

RSpec.feature "New entry user flow", :type => :feature do
  scenario "A user sees correct prepopulated fields on entry page" do
    VCR.use_cassette("new_entry_ux_flow") do
      visit root_path
      click_on "Login with Facebook"

      click_on "Create New Entry"

      expect(page).to have_field("Date", with: (Date.today.strftime("%Y-%m-%d")))
      expect(page).to have_field("Meal", with: "Choose Meal")
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

      find(".lunch-column").click_link("+")

      expect(page).to have_field("Date", with: (Date.today.strftime("%Y-%m-%d")))
      expect(page).to have_field("Meal", with: "Lunch")
      expect(page).to have_field("Ingredients", with: "")
      expect(page).to have_field("Notes", with: "")
    end
  end
end



# As a user
# When I click on a "+" on my dashboard chart
# And I am redirected to the new entry page
# The corresponding date and meal from the box I clicked "+" in is populated on the form
# And if I click "Create New Entry" I see today's date and no meal selected
