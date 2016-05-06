require "rails_helper"

RSpec.describe Manage::PiecesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/manage/pieces").to route_to("manage/pieces#index")
    end

    it "routes to #new" do
      expect(:get => "/manage/pieces/new").to route_to("manage/pieces#new")
    end

    it "routes to #show" do
      expect(:get => "/manage/pieces/1").to route_to("manage/pieces#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/manage/pieces/1/edit").to route_to("manage/pieces#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/manage/pieces").to route_to("manage/pieces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/manage/pieces/1").to route_to("manage/pieces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/manage/pieces/1").to route_to("manage/pieces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/manage/pieces/1").to route_to("manage/pieces#destroy", :id => "1")
    end

  end
end
