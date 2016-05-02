require 'rails_helper'

RSpec.describe "CreationCategories", type: :request do
  describe "GET /creation_categories" do
    it "works! (now write some real specs)" do
      get creation_categories_path
      expect(response).to have_http_status(200)
    end
  end
end
