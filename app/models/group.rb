class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts

  validates :name, presence: true
  validates :description, presence: true

end
