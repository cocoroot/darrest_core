require 'rails_helper'

RSpec.describe "CreationStatuses", type: :request do
  describe "GET /creation_statuses" do
    it "works! (now write some real specs)" do
      get creation_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
