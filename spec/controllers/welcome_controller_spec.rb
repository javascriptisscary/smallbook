require 'rails_helper'

describe WelcomeController, type: :controller  do

  context "GET #index" do
    
    before do
      get :index
    end
    
    it "will respond successfully with HTTP 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end


   it "renders the index template" do
      expect(response).to render_template("index")
    end



  end


end