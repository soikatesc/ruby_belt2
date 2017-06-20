class User < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :likes
  has_many :posts_liked, through: :likes, source: :post

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :alias, presence: true, length: { in: 2..20 }
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
end
