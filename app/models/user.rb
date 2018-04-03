class User < ApplicationRecord
  validates :name, :username, :group, presence: true
  has_secure_password
  has_many :matches
  has_many :user_contacts
end
