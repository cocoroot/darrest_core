require "rails_helper"

RSpec.describe Manage::CreatorTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creator_tags").to route_to("manage/creator_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creator_tags/new").to route_to("manage/creator_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creator_tags/1").to route_to("manage/creator_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creator_tags/1/edit").to route_to("manage/creator_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creator_tags").to route_to("manage/creator_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creator_tags/1").to route_to("manage/creator_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creator_tags/1").to route_to("manage/creator_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creator_tags/1").to route_to("manage/creator_tags#destroy", :id => "1")
    end

  end
end
