require 'rails_helper'

RSpec.describe "Core::Reports", type: :request do
  describe "GET /core_reports" do
    it "works! (now write some real specs)" do
      get core_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
