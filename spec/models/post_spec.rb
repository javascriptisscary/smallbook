require 'rails_helper'

describe User do
  
  context "when user posts a post"
      
      
    
    it "content will be correct" do
      post = create(:post)
      user = post.user
   
    expect(post.content).to eq "FooBar"
   
      
    end
    
    it "username will be correct" do
       post = create(:post)
       user = post.user
       
      expect(user.last_name).to eq "Puppy"
      expect(user.first_name).to eq "John"
    end
    
end