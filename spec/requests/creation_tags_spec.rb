require 'rails_helper'

RSpec.describe "CreationTags", type: :request do
  describe "GET /creation_tags" do
    it "works! (now write some real specs)" do
      get creation_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
