require 'rails_helper'

RSpec.describe "SiteUsers", type: :request do
  describe "GET /site_users" do
    it "works! (now write some real specs)" do
      get site_users_path
      expect(response).to have_http_status(200)
    end
  end
end
