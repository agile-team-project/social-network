# frozen_string_literal: true

class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :posts
  mount_uploader :group_avatar, GroupAvatarUploader
  mount_uploader :group_banner, GroupBannerUploader
  belongs_to :owner, class_name: 'User', optional: false, validate: true

  validates :name, presence: true
  validates :description, presence: true
  validates :group_banner, presence: :true
  validates :group_avatar, presence: :true
  validates :category, presence: :true
end
