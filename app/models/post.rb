# frozen_string_literal: true

class Post < ApplicationRecord
  #mount_uploader :avatar, AvatarUploader
  belongs_to :group, optional: true
  has_many :comments
  validates :text, presence: true, length: { minimum: 2 }

  belongs_to :user
end
