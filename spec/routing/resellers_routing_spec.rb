require "spec_helper"

describe ResellersController do
  describe "routing" do

    it "routes to #index" do
      get("/resellers").should route_to("resellers#index")
    end

    it "routes to #new" do
      get("/resellers/new").should route_to("resellers#new")
    end

    it "routes to #show" do
      get("/resellers/1").should route_to("resellers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/resellers/1/edit").should route_to("resellers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/resellers").should route_to("resellers#create")
    end

    it "routes to #update" do
      put("/resellers/1").should route_to("resellers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/resellers/1").should route_to("resellers#destroy", :id => "1")
    end

  end
end
