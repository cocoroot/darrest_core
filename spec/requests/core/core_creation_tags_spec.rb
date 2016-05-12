require 'rails_helper'

RSpec.describe "Core::CreationTags", type: :request do
  describe "GET /core_creation_tags" do
    it "works! (now write some real specs)" do
      get core_creation_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
