class Post < ApplicationRecord
  
  belongs_to :group, optional: true
  has_many :comments
  validates :text, presence: true, length: {minimum: 2}

 belongs_to :user

end
