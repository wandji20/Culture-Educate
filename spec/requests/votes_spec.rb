require 'rails_helper'

RSpec.describe "Votes", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/votes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/votes/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/votes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
