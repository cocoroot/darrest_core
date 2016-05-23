require 'rails_helper'

RSpec.describe "TagClasses", type: :request do
  describe "GET /tag_classes" do
    it "works! (now write some real specs)" do
      get tag_classes_path
      expect(response).to have_http_status(200)
    end
  end
end
