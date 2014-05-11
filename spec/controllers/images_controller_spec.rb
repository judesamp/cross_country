require 'spec_helper'

describe ImagesController do

  let(:user) { FactoryGirl.create(:user) }

  describe "GET #index" do

    it "assigns collection of images" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      image = FactoryGirl.create(:image)
      user.images << image
      xhr :get, :index, :format => "js"
      expect(assigns(:images)).to eq [image]
    end

    it "renders the index page" do
      user = FactoryGirl.create(:user)
      session[:user_id] = user.id
      xhr :get, :index, :format => "js"
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
      FactoryGirl.create(:user)
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

  describe "GET #edit" do

    it "assigns @image with specified image" do
      login(user)
      image = FactoryGirl.create(:image)
      get :edit, id: image
      expect(assigns(:image)).to eq image
    end

    it "renders the edit page" do
      login(user)
      image = FactoryGirl.create(:image)
      get :edit, id: image
      response.should render_template :edit
    end

  end


  describe "PUT #update" do

    it "updates image with specified attributes" do
      login(user)
      image = FactoryGirl.create(:image)
      put :update, id: image, :image => {title: "updated_title"}
      updated_image = Image.find(image.id)
      expect(updated_image.title).to eq "updated_title"
    end

    ### how to test failure redirect?

    it "redirects to the edit page" do
      login(user)
      image = FactoryGirl.create(:image)
      put :update, id: image, :image => {name: "updated_name"}
      response.should redirect_to "/images/#{image.id}"
    end

  end

  describe "DELETE #destroy" do

    it "updates image with specified attributes" do
      login(user)
      image = FactoryGirl.create(:image)
      expect { 
                delete :destroy, id: image

              }.to change(Image, :count).by(-1)
    end

    it "redirects to the  page" do
      login(user)
      image = FactoryGirl.create(:image)
      delete :destroy, id: image
      response.should redirect_to images_path
    end

  end

  describe "private method #ensure_logged_in" do

    it "should ensure a user is logged in before allowing access" do
      get :index
      response.should redirect_to root_path
    end

  end

  describe "GET download" do

    it "should download specified image" do
      login(user)
      image = FactoryGirl.create(:image)
      get :download, id: image.id
      response.headers["Content-Disposition"].should eq("attachment; filename=\"test_image.jpg\"")
    end

  end

end