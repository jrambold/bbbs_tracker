class Contact < ApplicationRecord
  validates :type, :recent, presence: true
  belongs_to :match
  has_many :contacts
end
