require 'rails_helper'

RSpec.describe "CreationComments", type: :request do
  describe "GET /creation_comments" do
    it "works! (now write some real specs)" do
      get creation_comments_path
      expect(response).to have_http_status(200)
    end
  end
end
