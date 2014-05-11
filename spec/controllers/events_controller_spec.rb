require 'spec_helper'

describe EventsController do
  
  let(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do

    it "assigns collection of events" do
      login(user)
      event = FactoryGirl.create(:event)
      current_user.events << event
      xhr :get, :index, :format => "js"
      expect(assigns(:events)).to eq [event]
    end

    it "renders the index page" do
      login(user)
      xhr :get, :index, :format => "js"
      response.should render_template :index
    end

  end

  describe "GET #new" do

    it "assigns @new_event with new event" do
      login(user)
      get :new
      expect(assigns(:new_event)).to be_a_new(Event)
    end

    it "renders the new page" do
      login(user)
      FactoryGirl.create(:user)
      get :new
      response.should render_template :new
    end

  end

  describe "POST #create" do

    context "valid events" do

      it "creates a new event" do
        login(user)
        event_attrs = FactoryGirl.attributes_for(:event)
        expect{
            post :create, event: event_attrs
        }.to change(Event, :count).by(1)
      end

       it "redirects to index" do
        login(user)
        post :create, event: FactoryGirl.attributes_for(:event)
        response.should redirect_to events_path
      end
     
    end

  end

  describe "GET #show" do

    it "assigns @event with the event" do
      login(user)
      event = FactoryGirl.create(:event)
      get :show, id: event
      expect(assigns(:event)).to eq event
    end

    it "assigns @comments with the appropriate event's comments" do
      login(user)
      event = FactoryGirl.create(:event)
      comment = FactoryGirl.create(:comment)
      event.comments << comment
      get :show, id: event
      expect(assigns(:comments).first).to eq comment 
    end

    it "assigns @new_comment with a new comment" do
      login(user)
      event = FactoryGirl.create(:event)
      FactoryGirl.build(:comment)
      get :show, id: event
      expect(assigns(:new_comment)).to be_a_new(Comment) 
    end

    it "renders the show page" do
      login(user)
      event = FactoryGirl.create(:event)
      get :show, id: event
      response.should render_template :show
    end

  end

  describe "GET #edit" do

    it "assigns @event with specified event" do
      login(user)
      event = FactoryGirl.create(:event)
      get :edit, id: event
      expect(assigns(:event)).to eq event
    end

    it "renders the edit page" do
      login(user)
      event = FactoryGirl.create(:event)
      get :edit, id: event
      response.should render_template :edit
    end

  end


  describe "PUT #update" do

    it "updates event with specified attributes" do
      login(user)
      event = FactoryGirl.create(:event)
      put :update, id: event, :event => {name: "updated_name"}
      updated_event = Event.find(event.id)
      expect(updated_event.name).to eq "updated_name"
    end

    ### how to test failure redirect?

    it "redirects to the edit page" do
      login(user)
      event = FactoryGirl.create(:event)
      put :update, id: event, :event => {name: "updated_name"}
      response.should redirect_to "/events/#{event.id}"
    end

  end

  describe "DELETE #destroy" do

    it "updates event with specified attributes" do
      login(user)
      event = FactoryGirl.create(:event)
      expect { 
                delete :destroy, id: event

              }.to change(Event, :count).by(-1)
    end

    it "redirects to the  page" do
      login(user)
      event = FactoryGirl.create(:event)
      delete :destroy, id: event
      response.should redirect_to events_path
    end

  end

  describe "GET download" do

    it "should download specified event image" do
      login(user)
      event = FactoryGirl.create(:event_with_image)
      get :download, id: event.id
      response.headers["Content-Disposition"].should eq("attachment; filename=\"test_image.jpg\"")
    end

  end

end



