class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  has_many :comments
  validates :post, presence: true, length: {minimum: 2}
end
