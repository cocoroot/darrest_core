require 'rails_helper'

RSpec.describe "SiteUserStatuses", type: :request do
  describe "GET /site_user_statuses" do
    it "works! (now write some real specs)" do
      get site_user_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
