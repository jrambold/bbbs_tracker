class Contact < ApplicationRecord
  validates :big_little, :contact_due, :person, :sor, :yos, :driving, presence: true
  belongs_to :match
  has_many :notes, dependent: :destroy
  has_many :user_contacts
  has_many :matches, through: :user_contacts

  def due_by_month?(months_away)
    check = (Date.today >> months_away)
    things = []
    if training_due?(check.mon)
      things << 'Training'
    end
    if contact_due?(check)
      things << 'Check In'
    end
    if sor_due?(check)
      things << 'SOR'
    end
    if yos_due?(check)
      things << 'YOS'
    end
    if driving_due?(check)
      things << 'License and Insurance'
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
    if (sor << 3) == match.start
      check.mon >= sor.mon || (check.year != match.start.year && check.mon == match.start.mon)
    else
      check.year >= sor.year && check.mon == sor.mon
    end
  end

  def yos_due?(check)
    if (yos << 3) == match.start
      check.mon >= yos.mon || (check.year != match.start.year && check.mon == match.start.mon)
    else
      check.year >= yos.year && check.mon == sor.mon
    end
  end

  def driving_due?(check)
    if check.year < driving.year
      false
    else
      check.mon >= driving.mon
    end
  end

  def has_been_year?
    (Date.today << 12) < match.start
  end

  def parse_update(values)
    if values.has_key?(:contact_due)
      if has_been_year?
        {:contact_due=>(Date.parse(values[:contact_due]) >> 1), :person=>'Little and Parent/Guardian'}
      else
        parsed = {:contact_due=>(Date.parse(values[:contact_due]) >> 3)}
        if person == 'Big'
          parsed[:person] = 'Big'
        elsif person == 'Little'
          parsed[:person] = 'Parent/Guardian'
        else
          parsed[:person] = 'Little'
        end
        values
      end
    elsif values.has_key?(:sor)
      if Date.parse(values[:sor]) < (match.start >> 11)
        {:sor=>(match.start >> 12)}
      else
        {:sor=>(Date.parse(values[:sor]) >> 12)}
      end
    elsif values.has_key?(:yos)
      if Date.parse(values[:yos]) < (match.start >> 11)
        {:yos=>(match.start >> 12)}
      else
        {:yos=>(Date.parse(values[:yos]) >> 12)}
      end
    elsif values.has_key?(:training)
      if values[:training]
        {:training=>true}
      else
        {:training=>false}
      end
    elsif values.has_key?(:driving)
      {:driving=>(Date.parse(values[:driving]) >> 12)}
    end
  end

end
