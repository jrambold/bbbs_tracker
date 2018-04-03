class Match < ApplicationRecord
  validates :big, :little, :guardian, presence: true
end
