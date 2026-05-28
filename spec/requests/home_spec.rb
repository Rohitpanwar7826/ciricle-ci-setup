require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "home controller" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end
end
