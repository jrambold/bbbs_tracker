class User < ApplicationRecord
  validates :name, :password, presence: true
  validates :username, presence: true, uniqueness: true
  has_secure_password
  has_many :matches
  has_many :user_contacts
  enum group: ['default', 'teamlead', 'super', 'admin']
end
