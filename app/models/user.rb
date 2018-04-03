class User < ApplicationRecord
  validates :name, :username, :group, presence: true
  has_secure_password
  has_many :matches
end
