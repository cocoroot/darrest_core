require 'rails_helper'

RSpec.describe "Core::CollectionCreations", type: :request do
  describe "GET /core_collection_creations" do
    it "works! (now write some real specs)" do
      get core_collection_creations_path
      expect(response).to have_http_status(200)
    end
  end
end
