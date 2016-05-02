require 'rails_helper'

RSpec.describe "CreatorTags", type: :request do
  describe "GET /creator_tags" do
    it "works! (now write some real specs)" do
      get creator_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
