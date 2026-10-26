require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /terms" do
    it "returns http success" do
      get "/static_pages/terms"
      # 👇ここにレスポンスの中身を出力するコードを追加
      puts "=== RESPONSE BODY START ==="
      puts response.body
      puts "=== RESPONSE BODY END ==="
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy" do
    it "returns http success" do
      get "/static_pages/privacy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /contact" do
    it "returns http success" do
      get "/static_pages/contact"
      expect(response).to have_http_status(:success)
    end
  end
end
