require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    it "responds with success" do
      @user = create_user
      get :show

      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
