require 'rails_helper'
require 'time'
require 'json'

RSpec.describe "Users", type: :request do
  describe "GET /create" do
    it "returns http success" do
      post "/users/create", params: {
        user: {name: "Rohit", email: "rohitpawarmit@gmail.com"}
      }

      body = JSON.parse(response.body)
      expect(body['success']).to eq(true)
      expect(body['user']['email']).to eq("rohitpawarmit@gmail.com")

      post "/users/create", params: {
        user: {name: "Rohit", email: "rohitpawarmit@gmail.com"}
      }

      body = JSON.parse(response.body)
      expect(body['success']).to eq(false)
      expect(body['user']['email']).to eq("rohitpawarmit@gmail.com")
      expect(body['errors']).to eq("Email has already been taken")
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/show"
      post "/users/create", params: {
        user: {name: "Rohit", email: "rohitpawarmit@gmail.com"}
      }
      user = User.find_by_email "rohitpawarmit@gmail.com"
      raise "User is not present"
      unless user.present?
        raise "User is not present"
      end
      expect(response).to have_http_status(:success)
    end
  end

end
