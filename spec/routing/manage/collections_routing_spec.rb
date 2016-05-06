require "rails_helper"

RSpec.describe Manage::CollectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/collections").to route_to("manage/collections#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/collections/new").to route_to("manage/collections#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/collections/1").to route_to("manage/collections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/collections/1/edit").to route_to("manage/collections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/collections").to route_to("manage/collections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/collections/1").to route_to("manage/collections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/collections/1").to route_to("manage/collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/collections/1").to route_to("manage/collections#destroy", :id => "1")
    end

  end
end
