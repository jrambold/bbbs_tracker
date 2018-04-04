class Contact < ApplicationRecord
  validates :big_little, :contact_due, :person, :sor, :yos, :driving, presence: true
  belongs_to :match
  has_many :notes
  has_many :user_contacts

  def due_by_month?(months_away)
    check = (Date.today >> months_away)
    things = []
    if training_due?(check.mon)
      things << :training
    end
    if contact_due?(check)
      things << :contact_due
    end
    if sor_due?(check)
      things << :sor
    end
    if yos_due?(check)
      things << :yos
    end
    if driving_due?(check)
      things << :driving
    end
    if things.length == 0
      things = nil
    end
    things
  end

  def training_due?(month)
    if training == true
      false
    else
      diff = month - match.start.mon
      if diff < 0
        diff += 12
      end
      (diff >= 3)
    end
  end

  def contact_due?(check)
    if (check << 12) <= match.start
      true
    else
      (check.mon + 12 - contact_due.mon) % 3 == 0
    end
  end

  def sor_due?(check)
    if sor << 3 == match.start
      check.mon >= sor.mon
    else
      check.mon == sor.mon
    end
  end

  def yos_due?(check)
    if sor << 3 == match.start
      check.mon >= yos.mon
    else
      check.mon == yos.mon
    end
  end

  def driving_due?(check)
    check = check << 12
    if check.year > driving.year
      true
    else
      check.mon > driving.mon
    end
  end

end
