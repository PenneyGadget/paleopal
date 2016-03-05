# require 'rails_helper'
#
# RSpec.describe Api::V1::CustomersController, type: :controller do
#
#   describe "GET #index" do
#     let(:json_response) { JSON.parse(response.body) }
#
#     it "returns all customers in json format" do
#       customers = create_list(:customer, 3)
#
#       get :index, format: :json
#
#       expect(json_response.first["id"]).to eq(customers.first.id)
#       expect(json_response.first["first_name"]).to eq(customers.first.first_name)
#       expect(json_response.last["id"]).to eq(customers.last.id)
#       expect(json_response.last["last_name"]).to eq(customers.last.last_name)
#       expect(json_response.count).to eq(3)
#       expect(response).to be_success
#       expect(response.status).to eq(200)
#     end
#   end
#
#   describe "GET #show" do
#     let(:json_response) { JSON.parse(response.body) }
#
#     it "returns customer with specified id in json" do
#       customer = create(:customer)
#
#       get :show, id: customer.id, format: :json
#
#       expect(json_response["id"]).to eq(customer.id)
#       expect(json_response["first_name"]).to eq(customer.first_name)
#       expect(json_response["last_name"]).to eq(customer.last_name)
#       # expect(json_response["created_at"]).to eq(customer.created_at)
#       # expect(json_response["updated_at"]).to eq(customer.updated_at)
#       expect(response).to be_success
#       expect(response.status).to eq(200)
#     end
#   end
#
# end
