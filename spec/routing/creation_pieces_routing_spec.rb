require "rails_helper"

RSpec.describe CreationPiecesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/creation_pieces").to route_to("creation_pieces#index")
    end

    it "routes to #new" do
      expect(:get => "/creation_pieces/new").to route_to("creation_pieces#new")
    end

    it "routes to #show" do
      expect(:get => "/creation_pieces/1").to route_to("creation_pieces#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/creation_pieces/1/edit").to route_to("creation_pieces#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/creation_pieces").to route_to("creation_pieces#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/creation_pieces/1").to route_to("creation_pieces#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/creation_pieces/1").to route_to("creation_pieces#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/creation_pieces/1").to route_to("creation_pieces#destroy", :id => "1")
    end

  end
end
