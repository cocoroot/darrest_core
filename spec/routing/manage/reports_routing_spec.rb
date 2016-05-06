require "rails_helper"

RSpec.describe Manage::ReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/reports").to route_to("manage/reports#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/reports/new").to route_to("manage/reports#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/reports/1").to route_to("manage/reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/reports/1/edit").to route_to("manage/reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/reports").to route_to("manage/reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/reports/1").to route_to("manage/reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/reports/1").to route_to("manage/reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/reports/1").to route_to("manage/reports#destroy", :id => "1")
    end

  end
end
