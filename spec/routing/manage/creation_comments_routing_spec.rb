require "rails_helper"

RSpec.describe Manage::CreationCommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/creation_comments").to route_to("manage/creation_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/creation_comments/new").to route_to("manage/creation_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/creation_comments/1").to route_to("manage/creation_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/creation_comments/1/edit").to route_to("manage/creation_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/creation_comments").to route_to("manage/creation_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/creation_comments/1").to route_to("manage/creation_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/creation_comments/1").to route_to("manage/creation_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/creation_comments/1").to route_to("manage/creation_comments#destroy", :id => "1")
    end

  end
end
