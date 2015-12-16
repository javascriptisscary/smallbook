class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  #avatar validation
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentPresenceValidator, attributes: :avatar
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 1.megabytes
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

end
