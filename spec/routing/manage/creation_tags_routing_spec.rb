require "rails_helper"

RSpec.describe Manage::CreationTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creation_tags").to route_to("manage/creation_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creation_tags/new").to route_to("manage/creation_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creation_tags/1").to route_to("manage/creation_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creation_tags/1/edit").to route_to("manage/creation_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creation_tags").to route_to("manage/creation_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creation_tags/1").to route_to("manage/creation_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creation_tags/1").to route_to("manage/creation_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creation_tags/1").to route_to("manage/creation_tags#destroy", :id => "1")
    end

  end
end
