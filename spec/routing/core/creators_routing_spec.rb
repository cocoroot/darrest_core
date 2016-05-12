require "rails_helper"

RSpec.describe Core::CreatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/creators").to route_to("core/creators#index")
    end

    it "routes to #new" do
      expect(:get => "/core/creators/new").to route_to("core/creators#new")
    end

    it "routes to #show" do
      expect(:get => "/core/creators/1").to route_to("core/creators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/creators/1/edit").to route_to("core/creators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/creators").to route_to("core/creators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/creators/1").to route_to("core/creators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/creators/1").to route_to("core/creators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/creators/1").to route_to("core/creators#destroy", :id => "1")
    end

  end
end
