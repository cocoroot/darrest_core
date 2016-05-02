require 'rails_helper'

RSpec.describe "CollectionCreations", type: :request do
  describe "GET /collection_creations" do
    it "works! (now write some real specs)" do
      get collection_creations_path
      expect(response).to have_http_status(200)
    end
  end
end
