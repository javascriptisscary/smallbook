class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", cover: "225x225>", friend: "100x100#", status: "50x50#", thumb: "25x25#" }, default_url: "/images/missing_:style.png"
  has_attached_file :cover, styles: {large: "1200x500>", small: "300x132#"}, default_url: "/images/missing_:style.png"
  #associations
  has_many :friendships
  has_many :friends, through: :friendships,
                         dependent: :destroy
  has_many :posts
  
  has_many :friend_requests
  has_many :respondees, through: :friend_requests,
                              dependent: :destroy
  
  has_many :likes          

  
  #avatar validation for paperclip
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
  
  #cover image vlaidation for paperclip
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :cover, less_than: 2.megabytes
  validates_attachment_file_name :cover, matches: [/png\Z/, /jpe?g\Z/]

  #standard validations
  validates :first_name, :last_name, :birthday, :email, presence:true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {minimum: 2} 
  validates :first_name, :last_name, length: {maximum: 15}
  validates :password, length: {minimum: 8},  on: :create
  validates_confirmation_of :password
  validates :zip, length: { is: 5}, numericality: { only_integer:true }
  
  
  #validate associations
  validates_associated :friendships, :friend_requests


  def full_name
    self.first_name + " " + self.last_name
  end
 
 
  def friends?(id)
    self.friendships.each do |friendship|
      if friendship.friend_id == id
        return true
      end
    end
    return false
    
  end
    
    
    def all_friends
      friends =[]
      self.friendships.each do |friendship|
        friends.push(friendship)
      end
      return friends.sort!
    end
  

 

end
