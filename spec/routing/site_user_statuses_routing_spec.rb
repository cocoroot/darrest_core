require "rails_helper"

RSpec.describe SiteUserStatusesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/site_user_statuses").to route_to("site_user_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/site_user_statuses/new").to route_to("site_user_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/site_user_statuses/1").to route_to("site_user_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_user_statuses/1/edit").to route_to("site_user_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/site_user_statuses").to route_to("site_user_statuses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/site_user_statuses/1").to route_to("site_user_statuses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/site_user_statuses/1").to route_to("site_user_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_user_statuses/1").to route_to("site_user_statuses#destroy", :id => "1")
    end

  end
end
