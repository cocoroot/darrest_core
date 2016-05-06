require 'rails_helper'

RSpec.describe "Core::Goods", type: :request do
  describe "GET /core_goods" do
    it "works! (now write some real specs)" do
      get core_goods_path
      expect(response).to have_http_status(200)
    end
  end
end
