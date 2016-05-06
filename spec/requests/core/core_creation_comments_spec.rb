require 'rails_helper'

RSpec.describe "Core::CreationComments", type: :request do
  describe "GET /core_creation_comments" do
    it "works! (now write some real specs)" do
      get core_creation_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
