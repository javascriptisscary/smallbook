class Friendship < ActiveRecord::Base

  belongs_to :user
  belongs_to :friend, class_name: "User"
  

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?


# make sure when a new friend is created, the inverse happens.
# for example: bob become friends with jane. methods kick in to make sure Jane is also friends with Bob.
  

  
  def create_inverse
    self.class.create(inverted_values)
  end
  
  def destroy_inverses
    inverses.destroy_all
  end
  
  def has_inverse?
    self.class.exists?(inverted_values)
  end
  
  def inverses
    self.class.where(inverted_values)
  end
  
  
  #invert the values
  def inverted_values
    {friend_id: user_id, user_id: friend_id}
  end
  

end
