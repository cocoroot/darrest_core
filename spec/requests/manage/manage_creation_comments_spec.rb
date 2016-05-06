require 'rails_helper'

RSpec.describe "Manage::CreationComments", type: :request do
  describe "GET /manage_creation_comments" do
    it "works! (now write some real specs)" do
      get manage_creation_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
