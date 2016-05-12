require "rails_helper"

RSpec.describe Core::CreationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/creations").to route_to("core/creations#index")
    end

    it "routes to #new" do
      expect(:get => "/core/creations/new").to route_to("core/creations#new")
    end

    it "routes to #show" do
      expect(:get => "/core/creations/1").to route_to("core/creations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/creations/1/edit").to route_to("core/creations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/creations").to route_to("core/creations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/creations/1").to route_to("core/creations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/creations/1").to route_to("core/creations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/creations/1").to route_to("core/creations#destroy", :id => "1")
    end

  end
end
