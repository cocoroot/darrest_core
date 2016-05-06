require "rails_helper"

RSpec.describe Core::CategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/categories").to route_to("core/categories#index")
    end

    it "routes to #new" do
      expect(:get => "/core/categories/new").to route_to("core/categories#new")
    end

    it "routes to #show" do
      expect(:get => "/core/categories/1").to route_to("core/categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/categories/1/edit").to route_to("core/categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/categories").to route_to("core/categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/categories/1").to route_to("core/categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/categories/1").to route_to("core/categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/categories/1").to route_to("core/categories#destroy", :id => "1")
    end

  end
end
