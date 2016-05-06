require 'rails_helper'

RSpec.describe "Core::CreationImages", type: :request do
  describe "GET /core_creation_images" do
    it "works! (now write some real specs)" do
      get core_creation_images_path
      expect(response).to have_http_status(200)
    end
  end
end
