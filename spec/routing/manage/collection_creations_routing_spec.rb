require "rails_helper"

RSpec.describe Manage::CollectionCreationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/collection_creations").to route_to("manage/collection_creations#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/collection_creations/new").to route_to("manage/collection_creations#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/collection_creations/1").to route_to("manage/collection_creations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/collection_creations/1/edit").to route_to("manage/collection_creations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/collection_creations").to route_to("manage/collection_creations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/collection_creations/1").to route_to("manage/collection_creations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/collection_creations/1").to route_to("manage/collection_creations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/collection_creations/1").to route_to("manage/collection_creations#destroy", :id => "1")
    end

  end
end
