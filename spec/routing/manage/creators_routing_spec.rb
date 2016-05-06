require "rails_helper"

RSpec.describe Manage::CreatorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creators").to route_to("manage/creators#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creators/new").to route_to("manage/creators#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creators/1").to route_to("manage/creators#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creators/1/edit").to route_to("manage/creators#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creators").to route_to("manage/creators#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creators/1").to route_to("manage/creators#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creators/1").to route_to("manage/creators#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creators/1").to route_to("manage/creators#destroy", :id => "1")
    end

  end
end
