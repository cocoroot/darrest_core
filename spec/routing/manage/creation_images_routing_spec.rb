require "rails_helper"

RSpec.describe Manage::CreationImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creation_images").to route_to("manage/creation_images#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creation_images/new").to route_to("manage/creation_images#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creation_images/1").to route_to("manage/creation_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creation_images/1/edit").to route_to("manage/creation_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creation_images").to route_to("manage/creation_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creation_images/1").to route_to("manage/creation_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creation_images/1").to route_to("manage/creation_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creation_images/1").to route_to("manage/creation_images#destroy", :id => "1")
    end

  end
end
