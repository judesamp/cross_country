require 'spec_helper'

describe CommentsController do
  
  let(:user) { FactoryGirl.create(:user) }
  
  describe "get #index" do
    
    context "image comment" do
      it "assigns a collection of image comments" do
        login(user)
        image = FactoryGirl.create(:image)
        comment = FactoryGirl.create(:comment)
        image.comments << comment 
        get :index, image_id: image.id
        expect(assigns(:comments).first).to eq comment
      end

      it "renders the index page" do
        login(user)
        image = FactoryGirl.create(:image)
        comment = FactoryGirl.create(:comment)
        image.comments << comment 
        get :index, image_id: image.id
        response.should render_template :index
      end
    end

    context "event comment" do

      it "assigns a collection of event comments" do
        login(user)
        event = FactoryGirl.create(:event)
        comment = FactoryGirl.create(:comment)
        event.comments << comment 
        get :index, event_id: event.id
        expect(assigns(:comments).first).to eq comment
      end

      it "renders the index page" do
        login(user)
        event = FactoryGirl.create(:event)
        comment = FactoryGirl.create(:comment)
        event.comments << comment 
        get :index, event_id: event.id
        response.should render_template :index
      end

    end

  end

  describe "get #new" do

    it "assigns @comment with a new comment" do
      login(user)
      event = FactoryGirl.create(:event)
      get :new, event_id: event.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "renders the new page" do
      login(user)
      event = FactoryGirl.create(:event)
      get :new, event_id: event.id
      response.should render_template :new
    end

  end

  describe "post #create" do

    context "image comment" do

      it "creates a new image comment" do
        login(user)
        image = FactoryGirl.create(:image)
        expect{

          post :create, image_id: image.id, comment: FactoryGirl.attributes_for(:comment)

        }.to change(Comment, :count).by(1)
      end

      it "redirects to the image show page" do
        login(user)
        image = FactoryGirl.create(:image)
        post :create, image_id: image.id, comment: FactoryGirl.attributes_for(:comment)
        response.should redirect_to image_path(image)
      end

    end

    context "event comment" do

      it "creates a new event comment" do
        login(user)
        event = FactoryGirl.create(:event)
        expect{

          post :create, event_id: event.id, comment: FactoryGirl.attributes_for(:comment)

        }.to change(Comment, :count).by(1)
      end

      it "redirects to the event show page" do
        login(user)
        event = FactoryGirl.create(:event)
        post :create, event_id: event.id, comment: FactoryGirl.attributes_for(:comment)
        response.should redirect_to event_path(event)
      end

    end

  end

end