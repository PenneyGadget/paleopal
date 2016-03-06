require 'rails_helper'

RSpec.describe User, type: :model do
  it "collects proper user data" do
    user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:facebook])

    expect(user.name).to eq("Penney Gadget")
    expect(user.email).to eq("penney@email.com")
    expect(user.oauth_token).to_not eq(nil)
  end

  it { should have_many(:entries) }
  
end
