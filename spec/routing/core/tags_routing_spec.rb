require "rails_helper"

RSpec.describe Core::TagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/tags").to route_to("core/tags#index")
    end

    it "routes to #new" do
      expect(:get => "/core/tags/new").to route_to("core/tags#new")
    end

    it "routes to #show" do
      expect(:get => "/core/tags/1").to route_to("core/tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/tags/1/edit").to route_to("core/tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/tags").to route_to("core/tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/tags/1").to route_to("core/tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/tags/1").to route_to("core/tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/tags/1").to route_to("core/tags#destroy", :id => "1")
    end

  end
end
