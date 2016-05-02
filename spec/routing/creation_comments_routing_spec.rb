require "rails_helper"

RSpec.describe CreationCommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creation_comments").to route_to("creation_comments#index")
    end

    it "routes to #new" do
      expect(:get => "/creation_comments/new").to route_to("creation_comments#new")
    end

    it "routes to #show" do
      expect(:get => "/creation_comments/1").to route_to("creation_comments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creation_comments/1/edit").to route_to("creation_comments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creation_comments").to route_to("creation_comments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creation_comments/1").to route_to("creation_comments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creation_comments/1").to route_to("creation_comments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creation_comments/1").to route_to("creation_comments#destroy", :id => "1")
    end

  end
end
