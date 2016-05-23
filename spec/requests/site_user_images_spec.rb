require 'rails_helper'

RSpec.describe "SiteUserImages", type: :request do
  describe "GET /site_user_images" do
    it "works! (now write some real specs)" do
      get site_user_images_path
      expect(response).to have_http_status(200)
    end
  end
end
