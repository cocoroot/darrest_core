require "rails_helper"

RSpec.describe Manage::UsersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/users").to route_to("manage/users#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/users/new").to route_to("manage/users#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/users/1").to route_to("manage/users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/users/1/edit").to route_to("manage/users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/users").to route_to("manage/users#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/users/1").to route_to("manage/users#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/users/1").to route_to("manage/users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/users/1").to route_to("manage/users#destroy", :id => "1")
    end

  end
end
