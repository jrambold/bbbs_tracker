class Contact < ApplicationRecord
  validates :type, :recent, presence: true
end
