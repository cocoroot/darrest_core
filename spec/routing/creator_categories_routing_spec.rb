require "rails_helper"

RSpec.describe CreatorCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creator_categories").to route_to("creator_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/creator_categories/new").to route_to("creator_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/creator_categories/1").to route_to("creator_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creator_categories/1/edit").to route_to("creator_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creator_categories").to route_to("creator_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creator_categories/1").to route_to("creator_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creator_categories/1").to route_to("creator_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creator_categories/1").to route_to("creator_categories#destroy", :id => "1")
    end

  end
end
