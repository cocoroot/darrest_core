require "rails_helper"

RSpec.describe Manage::TagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/tags").to route_to("manage/tags#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/tags/new").to route_to("manage/tags#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/tags/1").to route_to("manage/tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/tags/1/edit").to route_to("manage/tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/tags").to route_to("manage/tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/tags/1").to route_to("manage/tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/tags/1").to route_to("manage/tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/tags/1").to route_to("manage/tags#destroy", :id => "1")
    end

  end
end
