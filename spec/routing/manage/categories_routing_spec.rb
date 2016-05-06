require "rails_helper"

RSpec.describe Manage::CategoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/categories").to route_to("manage/categories#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/categories/new").to route_to("manage/categories#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/categories/1").to route_to("manage/categories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/categories/1/edit").to route_to("manage/categories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/categories").to route_to("manage/categories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/categories/1").to route_to("manage/categories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/categories/1").to route_to("manage/categories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/categories/1").to route_to("manage/categories#destroy", :id => "1")
    end

  end
end
