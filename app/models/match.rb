class Match < ApplicationRecord
  validates :big, :little, :guardian, :start, presence: true
  belongs_to :user
  has_many :contacts, dependent: :destroy

  def create_contacts
    contacts.create!(big_little: 'big',
                    contact_due: (start+14),
                    person: 'Big',
                    sor: (start >> 3),
                    yos: Date.new(3099,1,1),
                    training: false,
                    driving: (start >> 12))

    contacts.create(big_little: 'little',
                    contact_due: (start+14),
                    person: 'Little and Parent/Guardian',
                    sor: (start >> 3),
                    yos: (start >> 3),
                    training: true,
                    driving: Date.new(3099,1,1))
  end
end
