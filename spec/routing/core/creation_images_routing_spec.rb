require "rails_helper"

RSpec.describe Core::CreationImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/creation_images").to route_to("core/creation_images#index")
    end

    it "routes to #new" do
      expect(:get => "/core/creation_images/new").to route_to("core/creation_images#new")
    end

    it "routes to #show" do
      expect(:get => "/core/creation_images/1").to route_to("core/creation_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/creation_images/1/edit").to route_to("core/creation_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/creation_images").to route_to("core/creation_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/creation_images/1").to route_to("core/creation_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/creation_images/1").to route_to("core/creation_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/creation_images/1").to route_to("core/creation_images#destroy", :id => "1")
    end

  end
end
