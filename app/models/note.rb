class Note < ApplicationRecord
  validates :comment, presence: true
end
