require "rails_helper"

RSpec.describe Manage::GoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/goods").to route_to("manage/goods#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/goods/new").to route_to("manage/goods#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/goods/1").to route_to("manage/goods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/goods/1/edit").to route_to("manage/goods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/goods").to route_to("manage/goods#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/goods/1").to route_to("manage/goods#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/goods/1").to route_to("manage/goods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/goods/1").to route_to("manage/goods#destroy", :id => "1")
    end

  end
end
