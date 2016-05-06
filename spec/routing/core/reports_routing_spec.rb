require "rails_helper"

RSpec.describe Core::ReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/reports").to route_to("core/reports#index")
    end

    it "routes to #new" do
      expect(:get => "/core/reports/new").to route_to("core/reports#new")
    end

    it "routes to #show" do
      expect(:get => "/core/reports/1").to route_to("core/reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/reports/1/edit").to route_to("core/reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/reports").to route_to("core/reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/reports/1").to route_to("core/reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/reports/1").to route_to("core/reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/reports/1").to route_to("core/reports#destroy", :id => "1")
    end

  end
end
