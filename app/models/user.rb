class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", friend: "100x100#", status: "50x50#", thumb: "25x25#" }, default_url: "/images/missing_:style.png"
  
  #associations
  has_many :friendships
  has_many :friends, through: :friendships,
                     dependent: :destroy
  has_many :posts
  
  
  #avatar validation for paperclip
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  #standard validations
  validates :first_name, :last_name, :birthday, :email, presence:true
  validates :email, uniqueness: true
  validates :first_name, :last_name, length: {minimum: 2} 
  validates :first_name, :last_name, length: {maximum: 15}
  validates :password, length: {minimum: 8},  on: :create
  validates :zip, length: { is: 5}, numericality: { only_integer:true } 
  
  #validate associations
  validates_associated :friendships



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
    
  

 

end
