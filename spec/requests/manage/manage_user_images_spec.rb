require 'rails_helper'

RSpec.describe "Manage::UserImages", type: :request do
  describe "GET /manage_user_images" do
    it "works! (now write some real specs)" do
      get manage_user_images_path
      expect(response).to have_http_status(200)
    end
  end
end
