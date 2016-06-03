require "rails_helper"

RSpec.describe SiteUserHeaderImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/site_user_header_images").to route_to("site_user_header_images#index")
    end

    it "routes to #new" do
      expect(:get => "/site_user_header_images/new").to route_to("site_user_header_images#new")
    end

    it "routes to #show" do
      expect(:get => "/site_user_header_images/1").to route_to("site_user_header_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_user_header_images/1/edit").to route_to("site_user_header_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/site_user_header_images").to route_to("site_user_header_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/site_user_header_images/1").to route_to("site_user_header_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/site_user_header_images/1").to route_to("site_user_header_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_user_header_images/1").to route_to("site_user_header_images#destroy", :id => "1")
    end

  end
end
