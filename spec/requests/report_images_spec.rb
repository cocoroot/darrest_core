require 'rails_helper'

RSpec.describe "ReportImages", type: :request do
  describe "GET /report_images" do
    it "works! (now write some real specs)" do
      get report_images_path
      expect(response).to have_http_status(200)
    end
  end
end
