require 'rails_helper'

describe Friendship do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:friend) }

#before do
 #   @user1 = FactoryGirl.build(:user)
  #  @user2 = FactoryGirl.build(:user)
  #end

#when friend is created, the inverse happens (the other person is also a friend.)
#  context "when friend is created" do
  #  before do
   #   Friendship.create(user_id: @user1.id, friend_id: @user2.id)
  #  end
    
  #  it "makes the inverse happens" do
   #   @user1.friendship.
      


end  