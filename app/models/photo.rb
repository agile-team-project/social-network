class Photo < ApplicationRecord

  mount_uploader :picture
  belongs_to :user
  belongs_to :post

end
