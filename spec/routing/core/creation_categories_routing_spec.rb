require "rails_helper"

RSpec.describe Core::CreationCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/creation_categories").to route_to("core/creation_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/core/creation_categories/new").to route_to("core/creation_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/core/creation_categories/1").to route_to("core/creation_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/creation_categories/1/edit").to route_to("core/creation_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/creation_categories").to route_to("core/creation_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/creation_categories/1").to route_to("core/creation_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/creation_categories/1").to route_to("core/creation_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/creation_categories/1").to route_to("core/creation_categories#destroy", :id => "1")
    end

  end
end
