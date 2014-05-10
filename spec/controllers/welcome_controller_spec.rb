require "spec_helper"

describe WelcomeController do
  
  let(:user) { FactoryGirl.create(:user) }

  describe "get #index" do

    context "user not signed in" do

      #change this to assign random images
      it "assigns a collection of images" do
        get :index
        expect(assigns(:images)).to be_empty
      end

      it "renders the index page" do
        get :index
        response.should render_template :index
      end

    end

    context "user signed in" do

      it "assigns a collection of images" do
        login(user)
        image = FactoryGirl.create(:image)
        get :index
        expect(assigns(:images)[0]).to eq image
      end

      it "renders the index page" do
        login(user)
        get :index
        response.should render_template :index
      end
      
    end

  end

end


