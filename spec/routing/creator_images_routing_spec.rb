require "rails_helper"

RSpec.describe CreatorImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creator_images").to route_to("creator_images#index")
    end

    it "routes to #new" do
      expect(:get => "/creator_images/new").to route_to("creator_images#new")
    end

    it "routes to #show" do
      expect(:get => "/creator_images/1").to route_to("creator_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creator_images/1/edit").to route_to("creator_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creator_images").to route_to("creator_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creator_images/1").to route_to("creator_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creator_images/1").to route_to("creator_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creator_images/1").to route_to("creator_images#destroy", :id => "1")
    end

  end
end
