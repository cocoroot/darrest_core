require 'rails_helper'

RSpec.describe "Manage::CreatorTags", type: :request do
  describe "GET /manage_creator_tags" do
    it "works! (now write some real specs)" do
      get manage_creator_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
