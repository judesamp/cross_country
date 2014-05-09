# require 'spec_helper'


# describe CommentsController do


#   describe "GET #index" do

#     it "assigns collection of comments" do
#       session[:user_id] = user.id
#       # x = FactoryGirl.create(:comment)
#       # puts x.inspect
#       # get :index
#       # assigns(:comment).count.should eq(1)
#     end

#     it "renders the index page" do
#       user = FactoryGirl.create(:user)
#       session[:user_id] = user.id
#       get :index
#       response.should render_template :index
#     end

#   end

#   describe "GET #new" do

#     it "assigns @comment with new comment" do
#       new_comment = FactoryGirl.create(:comment)
#       get :new
#       expect(assigns(:comment)).to eq new_comment
#     end

#     it "renders the new page" do
#       session[:user_id] = user.id
#       get :new
#       response.should render_template :new
#     end

#   end

#   describe "POST #create" do
#     context "valid comments" do
#       it "creates a new comment" do
#         comment_attrs = FactoryGirl.attributes_for(:comment)
#         expect{
#             post :create, comment: comment_attrs
#         }.to change(Comment, :count).by(1)
#       end
     
#     end

    


#     context "invalid comments" do
#       it "should"
#       it "should"
#       it "should"
#     end

#   end

# end







  
#   describe "GET #new" do
#     it "assigns @new_yard_sale with a new yard sale"
#     it "renders the new page"
#   end


#   describe "POST #create" do
#     context "valid yard sale attributes" do
#       it "creates a new yard sale" do
#         yard_sale_attrs = FactoryGirl.attributes_for(:yard_sale)
#         expect{
#           post :create, yard_sale: yard_sale_attrs
#         }.to change(YardSale, :count).by(1)
#       end

#       it "redirects to index" do
#         post :create, yard_sale: FactoryGirl.attributes_for(:yard_sale)
#         response.should redirect_to yard_sales_path
#       end

#     end

#     context "invalid yard sale attributes" do
#       it "does not create a new yard sale"
#       it "renders the new page"
#     end
#   end
# end