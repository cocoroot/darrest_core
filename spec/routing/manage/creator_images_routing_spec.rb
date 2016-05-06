require "rails_helper"

RSpec.describe Manage::CreatorImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creator_images").to route_to("manage/creator_images#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creator_images/new").to route_to("manage/creator_images#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creator_images/1").to route_to("manage/creator_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creator_images/1/edit").to route_to("manage/creator_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creator_images").to route_to("manage/creator_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creator_images/1").to route_to("manage/creator_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creator_images/1").to route_to("manage/creator_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creator_images/1").to route_to("manage/creator_images#destroy", :id => "1")
    end

  end
end
