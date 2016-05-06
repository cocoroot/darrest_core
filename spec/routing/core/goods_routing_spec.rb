require "rails_helper"

RSpec.describe Core::GoodsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/goods").to route_to("core/goods#index")
    end

    it "routes to #new" do
      expect(:get => "/core/goods/new").to route_to("core/goods#new")
    end

    it "routes to #show" do
      expect(:get => "/core/goods/1").to route_to("core/goods#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/goods/1/edit").to route_to("core/goods#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/goods").to route_to("core/goods#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/goods/1").to route_to("core/goods#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/goods/1").to route_to("core/goods#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/goods/1").to route_to("core/goods#destroy", :id => "1")
    end

  end
end
