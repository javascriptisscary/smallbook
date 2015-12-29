FactoryGirl.define do
  
  #normal user
  factory :user do
    first_name "John"
    last_name  "Puppy"
    email "johnpuppy@example.com"
    zip "86578"
    birthday "10-05-1950"
    webpage "http://www.google.com"
    password "12345678"
      
    
   # after(:create) do |user|
    #user.friends << FactoryGirl.create(:friend)
    #end



  end
    
    
end