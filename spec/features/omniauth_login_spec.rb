require 'rails_helper'
require 'spec_helper'

describe "Login from root page" do
  it "user signs in with Facebook" do
    VCR.use_cassette("facebook#root_page") do
      visit root_path
      expect(page).to have_content "Login with Facebook"

      click_on "Login with Facebook"
      expect(current_path).to eq(dashboard_path)

      click_on "Logout"
      expect(current_path).to eq(logout_path)
    end
  end
end
