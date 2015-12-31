require 'rails_helper'

describe User do
  
  it "can manange posts he owns" do
    post = create(:post)
    user = post.user
    user.can_manage_post?(post).should be_true
  end
end