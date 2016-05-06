require 'rails_helper'

RSpec.describe "Core::CreatorImages", type: :request do
  describe "GET /core_creator_images" do
    it "works! (now write some real specs)" do
      get core_creator_images_path
      expect(response).to have_http_status(200)
    end
  end
end
