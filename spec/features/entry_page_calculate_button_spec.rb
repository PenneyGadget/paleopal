# require "rails_helper"
#
# RSpec.feature "Entry page ajax", :type => :feature do
#   scenario "Calculate button shows nutrient subtotals", js: true do
#     VCR.use_cassette("dasboard_totals_column") do
#       visit root_path
#       click_on "Login with Facebook"
#       visit new_entry_path
#
#       expect(page).to have_content "Fat: 0g | Carbs: 0g | Protein: 0g"
#
#       fill_in "Date", with: "03/03/2016"
#       select "Breakfast", from: "Meal"
#       fill_in "Ingredients", with: "1oz bacon"
#       click_on "CALCULATE"
#
#       expect(page).to have_content "Fat: 11g | Carbs: 0g | Protein: 3g"
#     end
#   end
# end
