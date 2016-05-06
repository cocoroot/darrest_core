require 'rails_helper'

RSpec.describe "Manage::Reports", type: :request do
  describe "GET /manage_reports" do
    it "works! (now write some real specs)" do
      get manage_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
