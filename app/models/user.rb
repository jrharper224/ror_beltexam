class User < ActiveRecord::Base
  has_secure_password
  has_many :ideas
  has_many :likes
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :email, presence: true, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }
end
