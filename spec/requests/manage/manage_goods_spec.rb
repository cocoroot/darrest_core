require 'rails_helper'

RSpec.describe "Manage::Goods", type: :request do
  describe "GET /manage_goods" do
    it "works! (now write some real specs)" do
      get manage_goods_path
      expect(response).to have_http_status(200)
    end
  end
end
