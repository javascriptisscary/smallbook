FactoryGirl.define do
  
  #normal user
  factory :user do
    first_name "John"
    last_name  "Puppy"
    sequence(:email) { |n| "#{n}johnpuppy@myemail.com"}
    zip "86578"
    birthday "10-05-1950"
    webpage "http://www.google.com"
    password "12345678"
      
    
  end
    
  factory :post do
    content "FooBar"
    profile_id 100
    user
    
  end  
    
 
    
    
    
    
       # after(:create) do |user|
    #user.friends << FactoryGirl.create(:friend)
    #end
    
end