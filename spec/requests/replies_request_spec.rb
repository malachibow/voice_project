require 'rails_helper'

RSpec.describe "Replies", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/replies/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/replies/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/replies/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/replies/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
