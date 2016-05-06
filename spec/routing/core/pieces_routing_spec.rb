require "rails_helper"

RSpec.describe Core::PiecesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/core/pieces").to route_to("core/pieces#index")
    end

    it "routes to #new" do
      expect(:get => "/core/pieces/new").to route_to("core/pieces#new")
    end

    it "routes to #show" do
      expect(:get => "/core/pieces/1").to route_to("core/pieces#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/core/pieces/1/edit").to route_to("core/pieces#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/core/pieces").to route_to("core/pieces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/core/pieces/1").to route_to("core/pieces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/core/pieces/1").to route_to("core/pieces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/core/pieces/1").to route_to("core/pieces#destroy", :id => "1")
    end

  end
end
