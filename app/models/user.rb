class User < ApplicationRecord
  validates :name, :group, presence: true
end
