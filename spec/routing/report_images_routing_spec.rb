require "rails_helper"

RSpec.describe ReportImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/report_images").to route_to("report_images#index")
    end

    it "routes to #new" do
      expect(:get => "/report_images/new").to route_to("report_images#new")
    end

    it "routes to #show" do
      expect(:get => "/report_images/1").to route_to("report_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/report_images/1/edit").to route_to("report_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/report_images").to route_to("report_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/report_images/1").to route_to("report_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/report_images/1").to route_to("report_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/report_images/1").to route_to("report_images#destroy", :id => "1")
    end

  end
end
