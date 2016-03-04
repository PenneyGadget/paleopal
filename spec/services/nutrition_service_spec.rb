# require 'rails_helper'
#
# describe "InstagramService" do
#   before do
#     @current_user = User.find_or_create_by_auth(OmniAuth.config.mock_auth[:instagram])
#   end
#   let(:service) {InstagramService.new(@current_user)}
#
#   it "returns user info" do
#     VCR.use_cassette("instagram_service#user_info") do
#       service.user_info
#
#       expect(@current_user[:nickname]).to eq("Gadgetry")
#     end
#   end
#
# end
