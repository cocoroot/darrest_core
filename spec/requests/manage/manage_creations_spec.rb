require 'rails_helper'

RSpec.describe "Manage::Creations", type: :request do
  describe "GET /manage_creations" do
    it "works! (now write some real specs)" do
      get manage_creations_path
      expect(response).to have_http_status(200)
    end
  end
end
