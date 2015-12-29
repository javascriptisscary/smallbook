require 'rails_helper'

describe User do
  
  before do
      @user =build(:user)
  end
  
  it "should be valid" do
    expect(@user).to be_valid
  end
  
  #test full_name method
  context "first and last name present" do
    
    
    
      it "return first and last" do
        expect(@user.full_name).to eq "John Puppy"
      
      end
    end
  
    
    #validations
    context "email address not present" do
      
      it "shouldn't validiate users without an email address" do
        @no_email = build(:user, email: "")
        expect(@no_email).to_not be_valid
        
      
      end
    end
    
    
    context "email addresses are the same" do
      
      it "prevents duplicate email addresses" do
        user1=FactoryGirl.create(:user, email: "same1@same1.com")
        user2 =build(:user, email: "same1@same1.com")
        expect(user1).to be_valid
        expect(user2).to_not be_valid
      end
    end
    
  
  
end
    
    
    
    

    
    
