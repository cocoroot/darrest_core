require "rails_helper"

RSpec.describe Core::CollectionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/collections").to route_to("core/collections#index")
    end

    it "routes to #new" do
      expect(:get => "/core/collections/new").to route_to("core/collections#new")
    end

    it "routes to #show" do
      expect(:get => "/core/collections/1").to route_to("core/collections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/collections/1/edit").to route_to("core/collections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/collections").to route_to("core/collections#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/collections/1").to route_to("core/collections#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/collections/1").to route_to("core/collections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/collections/1").to route_to("core/collections#destroy", :id => "1")
    end

  end
end
