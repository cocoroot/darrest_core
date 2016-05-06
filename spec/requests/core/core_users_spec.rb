require 'rails_helper'

RSpec.describe "Core::Users", type: :request do
  describe "GET /core_users" do
    it "works! (now write some real specs)" do
      get core_users_path
      expect(response).to have_http_status(200)
    end
  end
end
