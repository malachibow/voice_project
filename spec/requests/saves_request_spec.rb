require 'rails_helper'

RSpec.describe "Saves", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/saves/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/saves/create"
      expect(response).to have_http_status(:success)
    end
  end

end
