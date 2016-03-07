require 'rails_helper'
require 'spec_helper'

describe "Unauthenticated user" do
  it "user sees error if not logged in" do
    visit dashboard_path
    expect(page).to have_content "The page you were looking for doesn't exist."
    expect(page).to_not have_content "Create New Entry"

    visit new_entry_path
    expect(page).to have_content "The page you were looking for doesn't exist."
    expect(page).to_not have_content "Create New Entry"

    visit "/entries/1"
    expect(page).to have_content "The page you were looking for doesn't exist."
    expect(page).to_not have_content "Create New Entry"
  end
end
