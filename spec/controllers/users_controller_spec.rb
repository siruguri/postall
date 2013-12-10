require 'spec_helper'

describe Devise::SessionsController do
  describe "logged-in users" do
    before (:each) do
      user = create(:user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in(user)
    end

    it "takes them to the root" do
      get :new
      response.should redirect_to(root_path)
    end

  end

end
