require "rails_helper"

RSpec.describe Manage::CreationCategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creation_categories").to route_to("manage/creation_categories#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creation_categories/new").to route_to("manage/creation_categories#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creation_categories/1").to route_to("manage/creation_categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creation_categories/1/edit").to route_to("manage/creation_categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creation_categories").to route_to("manage/creation_categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creation_categories/1").to route_to("manage/creation_categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creation_categories/1").to route_to("manage/creation_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creation_categories/1").to route_to("manage/creation_categories#destroy", :id => "1")
    end

  end
end
