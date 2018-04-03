class Note < ApplicationRecord
  validates :comment, presence: true
  belongs_to :contact
end
