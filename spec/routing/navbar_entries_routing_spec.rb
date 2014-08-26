require "spec_helper"

describe NavbarEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/navbar_entries").should route_to("navbar_entries#index")
    end

    it "routes to #new" do
      get("/navbar_entries/new").should route_to("navbar_entries#new")
    end

    it "routes to #show" do
      get("/navbar_entries/1").should route_to("navbar_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/navbar_entries/1/edit").should route_to("navbar_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/navbar_entries").should route_to("navbar_entries#create")
    end

    it "routes to #update" do
      put("/navbar_entries/1").should route_to("navbar_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/navbar_entries/1").should route_to("navbar_entries#destroy", :id => "1")
    end

  end
end
