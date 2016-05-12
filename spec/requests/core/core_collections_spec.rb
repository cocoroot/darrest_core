require 'rails_helper'

RSpec.describe "Core::Collections", type: :request do
  describe "GET /core_collections" do
    it "works! (now write some real specs)" do
      get core_collections_path
      expect(response).to have_http_status(200)
    end
  end
end
