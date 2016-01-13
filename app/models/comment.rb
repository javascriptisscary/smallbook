class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

 validates :content, presence: true,
                      length:  { maximum: 152 }

end
