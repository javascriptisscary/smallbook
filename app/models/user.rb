class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", friend: "100x100#", status: "50x50#", thumb: "25x25#" }, default_url: "/images/missing_:style.png"
  
  #avatar validation for paperclip
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  #standard validations
  validates :first_name, :last_name, :birthday, :email, presence:true
  validates :email, uniqueness: true

  #associations
  has_many :friendships
  has_many :friends, through: :friendships,
                     dependent: :destroy

has_many :posts

  def full_name
    self.first_name + " " + self.last_name
  end
 

end
