class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments
  
  validates :user_id, presence: true
  validates :profile_id, presence: true
  validates :content, presence: true,
                      length:  { maximum: 152 }
                      
                      
  

end
