require 'spec_helper'

# describe UsersController do
#   describe "" do
#     it "should"
#     it "should"
#     it "should" 

#   end

#   describe "" do
#     it "should"
#     it "should"
#     it "should"

#   end

#   describe "" do
#     it "should" 
#     it "should"
#     it "should"

#   end

# end





# describe YardSalesController do 
#   describe "GET #index" do
#     it "assigns collection of yard_sales" do
#       FactoryGirl.create(:yard_sale)
#       get :index
#       assigns(:yard_sales).count.should eq(1)
#     end

#     it "renders the index page" do
#       get :index
#       response.should render_template :index
#     end

#   end
  
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