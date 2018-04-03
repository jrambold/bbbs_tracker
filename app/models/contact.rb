class Contact < ApplicationRecord
  validates :type, :recent, presence: true
  belongs_to :match
  has_many :notes
  has_many :user_contacts
end
