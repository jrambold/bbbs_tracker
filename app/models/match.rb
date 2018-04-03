class Match < ApplicationRecord
  validates :big, :little, :guardian, presence: true
  belongs_to :user
  has_many :contacts
end
