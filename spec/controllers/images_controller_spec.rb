require 'spec_helper'

describe ImagesController do

  let(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do

    it "assigns collection of images" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      image = FactoryGirl.create(:image)
      user.images << image
      get :index
      expect(assigns(:images)).to eq [image]
    end

    it "renders the index page" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      get :index
      response.should render_template :index
    end

  end

  describe "GET #new" do

    it "assigns @new_image with new image" do
      login(user)
      get :new
      expect(assigns(:new_image)).to be_a_new(Image)
    end

    it "renders the new page" do
      login(user)
      user = FactoryGirl.create(:user)
      get :new
      response.should render_template :new
    end

  end

  describe "POST #create" do

    context "valid images" do

      it "creates a new image" do
        login(user)
        image_attrs = FactoryGirl.attributes_for(:image)
        expect{
            post :create, image: image_attrs
        }.to change(Image, :count).by(1)
      end

       it "redirects to index" do
        login(user)
        post :create, image: FactoryGirl.attributes_for(:image)
        id = assigns(:new_image).id
        response.should redirect_to image_path(id)
      end
     
    end

  end

  describe "GET #show" do

    it "assigns @image with the image" do
      login(user)
      image = FactoryGirl.create(:image)
      get :show, id: image
      expect(assigns(:image)).to eq image
    end

    it "assigns @comments with the appropriate image's comments" do
      login(user)
      image = FactoryGirl.create(:image)
      comment = FactoryGirl.create(:comment)
      image.comments << comment
      get :show, id: image
      expect(assigns(:comments).first).to eq comment 
    end

    it "assigns @comments with a new comment" do
      login(user)
      image = FactoryGirl.create(:image)
      get :show, id: image
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it "renders the show page" do
      login(user)
      image = FactoryGirl.create(:image)
      get :show, id: image
      response.should render_template :show
    end

  end

end