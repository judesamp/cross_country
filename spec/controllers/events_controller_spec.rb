require 'spec_helper'

describe EventsController do


  describe "GET #index" do

    it "assigns collection of events" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      event = FactoryGirl.create(:event)
      user.events << event
      get :index
      expect(assigns(:events)).to eq [event]
    end

    it "renders the index page" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      get :index
      response.should render_template :index
    end

  end

  # describe "GET #new" do

  #   it "assigns @comment with new comment" do
  #     new_comment = FactoryGirl.create(:comment)
  #     get :new
  #     expect(assigns(:comment)).to eq new_comment
  #   end

  #   it "renders the new page" do
  #     session[:user_id] = user.id
  #     get :new
  #     response.should render_template :new
  #   end

  # end

  # describe "POST #create" do
  #   context "valid comments" do
  #     it "creates a new comment" do
  #       comment_attrs = FactoryGirl.attributes_for(:comment)
  #       expect{
  #           post :create, comment: comment_attrs
  #       }.to change(Comment, :count).by(1)
  #     end
     
  #   end

    


  #   context "invalid comments" do
  #     it "should"
  #     it "should"
  #     it "should"
  #   end

  # end

end






