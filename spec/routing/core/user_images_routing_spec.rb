require "rails_helper"

RSpec.describe Core::UserImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/user_images").to route_to("core/user_images#index")
    end

    it "routes to #new" do
      expect(:get => "/core/user_images/new").to route_to("core/user_images#new")
    end

    it "routes to #show" do
      expect(:get => "/core/user_images/1").to route_to("core/user_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/user_images/1/edit").to route_to("core/user_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/user_images").to route_to("core/user_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/user_images/1").to route_to("core/user_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/user_images/1").to route_to("core/user_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/user_images/1").to route_to("core/user_images#destroy", :id => "1")
    end

  end
end
