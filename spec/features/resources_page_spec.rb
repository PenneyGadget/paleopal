require "rails_helper"

RSpec.feature "Resources page", :type => :feature do
  scenario "Resourcs can be viewed" do
    visit resources_path

    expect(page).to have_text("The basic tenants of a Paleo diet are that you want your macronutrient intake to be primarily from fat with moderate protein and low carbohydrates. These nutrients should come high quality whole foods.")
    expect(page).to have_link("The Definitive Guide to the Primal Eating Plan")
    expect(page).to have_link("Mother Nature's Perfect Macronutrient Ratio")
    expect(page).to have_link("Paleo FAQ")
  end
end
