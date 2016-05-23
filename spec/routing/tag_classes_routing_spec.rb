require "rails_helper"

RSpec.describe TagClassesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tag_classes").to route_to("tag_classes#index")
    end

    it "routes to #new" do
      expect(:get => "/tag_classes/new").to route_to("tag_classes#new")
    end

    it "routes to #show" do
      expect(:get => "/tag_classes/1").to route_to("tag_classes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tag_classes/1/edit").to route_to("tag_classes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tag_classes").to route_to("tag_classes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/tag_classes/1").to route_to("tag_classes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/tag_classes/1").to route_to("tag_classes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tag_classes/1").to route_to("tag_classes#destroy", :id => "1")
    end

  end
end
