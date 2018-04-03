class User < ApplicationRecord
  validates :name, :group, presence: true
  has_many :matches
end
