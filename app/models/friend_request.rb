class FriendRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :respondee, class_name: "User"


  after_create :create_received, unless: :exists? 
  after_destroy :destroy_other, if: :has_inverse?


# after_create: friend_request gets duplicated on respondee's end with an inverted user id and recieved: true.


  def destroy_other
    inverses.destroy_all  
  end
  
  def exists?
    self.class.exists?(user_id: user_id, received: true,  respondee_id: respondee_id, accepted: false )
  end
  
  def create_received
    
    self.class.create(received_values)
  end
  
  def inverse
    inverse= received_values
    inverse[:received] = false
    return inverse
  end
  
  
  def has_inverse?
   
    self.class.exists?(inverse)
  end
  
  def inverses
    self.class.where(inverse)
  end
  
    #make the respondee the new user
  def received_values
    
      { user_id: respondee_id, received: true,  respondee_id: user_id, accepted: false }
  end

end