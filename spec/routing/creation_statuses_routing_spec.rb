require "rails_helper"

RSpec.describe CreationStatusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creation_statuses").to route_to("creation_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/creation_statuses/new").to route_to("creation_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/creation_statuses/1").to route_to("creation_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creation_statuses/1/edit").to route_to("creation_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creation_statuses").to route_to("creation_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creation_statuses/1").to route_to("creation_statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creation_statuses/1").to route_to("creation_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creation_statuses/1").to route_to("creation_statuses#destroy", :id => "1")
    end

  end
end
