class Contact < ApplicationRecord
  validates :big_little, :contact_due, :person, :sor, :yos, :driving, presence: true
  belongs_to :match
  has_many :notes
  has_many :user_contacts
end
