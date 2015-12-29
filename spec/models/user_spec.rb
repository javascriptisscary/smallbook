require 'rails_helper'

describe User do
  
  #build common, valid user
  before do
      @user =build(:user)
  end
  
  
  context "when user is valid" do
  
    it "is valid" do
      expect(@user).to be_valid
    end
  end
  
  
  
  
  
 
 #associations
  it { is_expected.to have_many(:friendships) }
  it { is_expected.to have_many(:friends).through(:friendships) }


 
 
 
 
 
 
  #user methods
  
 # context "when calling existing friends?" do
  #  it "will return true" do
   #   @user.
          
  
  
  
  
  context "when we call self.full_name" do
    
    
    
      it " will return first and last name" do
        expect(@user.full_name).to eq "John Puppy"
      
      end
    end
  
  
  
  
  
    
  #password
  it { should have_secure_password }
  
  
  context "when password is less than 8 characters" do
    it "will not validate" do
      less_8 = build(:user, password: "happy12")
      expect(less_8).to_not be_valid
    end
  end
    
    
    
 
 
    
    #presence validations
    
    context "when first name not present" do
    
      it "will not validate users with no first name" do
        no_name = build(:user, first_name: "")
        expect(no_name).to_not be_valid
      end
    end
    
    context "when last name not present" do
      it "will not validate users with no last name" do
        no_last_name = build(:user, last_name: "")
        expect(no_last_name).to_not be_valid
      end
    end
    
    context "when birthday not present" do
      it "will not validate users with no birthday" do
        no_birthday = build(:user, birthday: "")
        expect(no_birthday).to_not be_valid
      end
    end
    
    context "when email address not present" do
      it "will not validiate users without an email address" do
        no_email = build(:user, email: "")
        expect(no_email).to_not be_valid
        
      
      end
    end
    
    
    
    
    
    #date
    context "when birthdate is not a date" do
      it "will not validate" do
        not_valid_date = build(:user, birthday: "1800")
        expect(not_valid_date).to_not be_valid
      end
    end
    
    
    
    
    
    
    
    
    #length
    context "when user.first_name is over 15 characters" do
      it "will not validate" do
          over_15 = build(:user, first_name: "abcdefghijklmvfg")
          expect(over_15).to_not be_valid
      end
    end
    
    context "when user.last_name is over 15 characters" do
      it "will not validate" do
        over_15 = build(:user, last_name: "abcdefghijklmnovq")
        expect(over_15).to_not be_valid
      end
    end
    
    context "when user.first_name is under 2 characters" do
      it "will not validate" do
        under_15 = build(:user, first_name: "a")
        expect(under_15).to_not be_valid
      end
    end 
    
    context "when user.last_name is under 2 characters" do
      it "will not validate" do
        under_15 = build(:user, last_name: "b")
        expect(under_15).to_not be_valid
      end
    end
    
    
    
    
    
    
    #uniqueness
    
    context "email addresses are the same" do
      
      it "prevents duplicate email addresses" do
        user1=FactoryGirl.create(:user, email: "same1@same1.com")
        user2 =build(:user, email: "same1@same1.com")
        expect(user1).to be_valid
        expect(user2).to_not be_valid
      end
    end
    
  
  
end
    
    
    
    

    
    
