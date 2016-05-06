require 'rails_helper'

RSpec.describe "Core::Creators", type: :request do
  describe "GET /core_creators" do
    it "works! (now write some real specs)" do
      get core_creators_path
      expect(response).to have_http_status(200)
    end
  end
end
