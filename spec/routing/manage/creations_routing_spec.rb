require "rails_helper"

RSpec.describe Manage::CreationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creations").to route_to("manage/creations#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creations/new").to route_to("manage/creations#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creations/1").to route_to("manage/creations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creations/1/edit").to route_to("manage/creations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creations").to route_to("manage/creations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creations/1").to route_to("manage/creations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creations/1").to route_to("manage/creations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creations/1").to route_to("manage/creations#destroy", :id => "1")
    end

  end
end
