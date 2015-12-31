require 'rails_helper'

describe UsersController, type: :controller  do

  before do
    @user = build(:user)
    @user2 = create(:user)
  end

  describe "GET #show" do
     
     
     
     context "when user is logged in" do
       it "loads profile page" do
         
         
         get :show, id: @user2.id
         expect(response).to be_success
         expect(response).to have_http_status(200)
     end
   end


     context "When no user is logged in" do
       it "redirects to root" do
         get :show, id: @user.id
         expect(response).to redirect_to(root_path)
       end
     end


  end
end