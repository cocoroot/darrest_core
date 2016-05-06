require 'rails_helper'

RSpec.describe "Manage::Creators", type: :request do
  describe "GET /manage_creators" do
    it "works! (now write some real specs)" do
      get manage_creators_path
      expect(response).to have_http_status(200)
    end
  end
end
