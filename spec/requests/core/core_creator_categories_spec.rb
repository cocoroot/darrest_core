require 'rails_helper'

RSpec.describe "Core::CreatorCategories", type: :request do
  describe "GET /core_creator_categories" do
    it "works! (now write some real specs)" do
      get core_creator_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
