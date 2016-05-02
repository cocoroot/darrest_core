require "rails_helper"

RSpec.describe UserImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_images").to route_to("user_images#index")
    end

    it "routes to #new" do
      expect(:get => "/user_images/new").to route_to("user_images#new")
    end

    it "routes to #show" do
      expect(:get => "/user_images/1").to route_to("user_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_images/1/edit").to route_to("user_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_images").to route_to("user_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_images/1").to route_to("user_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_images/1").to route_to("user_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_images/1").to route_to("user_images#destroy", :id => "1")
    end

  end
end
