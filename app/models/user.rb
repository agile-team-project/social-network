class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts 
  has_many :comments
  has_many :friends
  has_and_belongs_to_many :groups

  scope :with_name_or_email, lambda { |q|
	                                  where '(name ILIKE ?) OR (email ILIKE ?)',
	                                        "%#{q}%", "%#{q}%"
	                                }

end
