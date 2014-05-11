require 'spec_helper'

describe SessionsController do
  
  describe "POST #create" do

    it "should create a new session" do
      current_user = FactoryGirl.create(:custom_user)
      login(current_user)
      expect(session[:user_id]).to eq current_user.id
    end

  end

  describe "get #destroy" do
    it "should logout current user" do
      current_user = FactoryGirl.create(:custom_user)
      login(current_user)
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

  end

end