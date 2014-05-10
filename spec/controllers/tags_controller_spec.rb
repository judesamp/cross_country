require 'spec_helper'

describe TagsController do
  
  let(:user) { FactoryGirl.create(:user) }

  describe "GET index" do
    
    it "assigns a collection of tags" do
      login(user)
      image = FactoryGirl.create(:image)
      tag = FactoryGirl.create(:tag)
      image.tags << tag
      get :index, image_id: image.id
      expect(assigns(:tags).first).to eq tag
    end

    it "renders the index page" do
      login(user)
      image = FactoryGirl.create(:image)
      tag = FactoryGirl.create(:tag)
      image.tags << tag
      get :index, image_id: image.id
      response.should render_template :index
    end

  end

  describe "GET #new" do

    it "assigns @new_tag with a new tag" do
      login(user)
      image = FactoryGirl.create(:image)
      get :new, image_id: image.id
      expect(assigns(:tag)).to be_a_new(Tag)
    end

    it "assigns @current_image with the specified image" do
      login(user)
      image = FactoryGirl.create(:image)
      get :new, image_id: image.id
      expect(assigns(:current_image)).to eq image
    end

    it "renders the new page" do
      login(user)
      image = FactoryGirl.create(:image)
      get :new, image_id: image.id
      response.should render_template :new
    end

  end

  describe "POST #create" do

    it "creates a new tag" do
      login(user)
      image = FactoryGirl.create(:image)
      expect{

        post :create, image_id: image.id, tag: FactoryGirl.attributes_for(:tag)

      }.to change(Tag, :count).by(1)

    end

    it "redirects to the current image show page" do
      login(user)
      image = FactoryGirl.create(:image)
      post :create, image_id: image.id, tag: FactoryGirl.attributes_for(:tag)
      response.should redirect_to image_path(image)
    end

  end
  
end