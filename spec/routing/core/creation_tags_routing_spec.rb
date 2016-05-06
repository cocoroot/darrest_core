require "rails_helper"

RSpec.describe Core::CreationTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/creation_tags").to route_to("core/creation_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/core/creation_tags/new").to route_to("core/creation_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/core/creation_tags/1").to route_to("core/creation_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/creation_tags/1/edit").to route_to("core/creation_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/creation_tags").to route_to("core/creation_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/creation_tags/1").to route_to("core/creation_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/creation_tags/1").to route_to("core/creation_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/creation_tags/1").to route_to("core/creation_tags#destroy", :id => "1")
    end

  end
end
