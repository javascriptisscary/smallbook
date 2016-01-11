require 'rails_helper'

RSpec.describe Like, type: :model do
  
  context "user likes a post"

  it "will have 1 like" do
    post = create(:post)
    user = post.user
   
    expect(post.likes).to eq 1
  end
  
  
end
