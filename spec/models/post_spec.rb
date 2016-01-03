require 'rails_helper'

describe User do
  
  context "when user posts a post"
    it "will post correctly" do
      post = create(:post)
      user = post.user
      post.content = "FooBar"
    end
    
    
    
end