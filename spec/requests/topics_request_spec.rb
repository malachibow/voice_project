require 'rails_helper'

RSpec.describe "Topics", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/topics/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/topics/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/topics/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/topics/delete"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /unproductive" do
    it "returns http success" do
      get "/topics/unproductive"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /agree" do
    it "returns http success" do
      get "/topics/agree"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /disagree" do
    it "returns http success" do
      get "/topics/disagree"
      expect(response).to have_http_status(:success)
    end
  end

end
