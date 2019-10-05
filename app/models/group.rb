class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts
  belongs_to :owner, class_name: 'User', optional: false, validate: true

  validates :name, presence: true
  validates :description, presence: true

end
