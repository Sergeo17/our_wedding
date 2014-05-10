class Household < ActiveRecord::Base

  has_many :guests
  has_many :comments
  accepts_nested_attributes_for :guests, allow_destroy: true
  accepts_nested_attributes_for :comments
  validates_presence_of :zipcode, :message => "Zip Code is Required"


  def self.search(search, zipcode)
    Household.joins(:guests).where('lower(lastname) = lower(?) AND lower(zipcode) = lower(?) AND is_plus_one = ?' , "#{search}", "#{zipcode}", false)
  end

  def self.admin_search(search)
    if search
      Household.joins(:guests).where('lower(lastname) like lower(?) or lower(firstname) like lower(?)', "%#{search}%", "%#{search}%" ).uniq
    else
      all
    end
  end


  def has_plus_one()
    has_plus_one = 0
    self.guests.each do |g|
      has_plus_one = has_plus_one + 1 if g.is_plus_one?
    end
    has_plus_one
  end

  def household_attending()
    household_attending = 0
    self.guests.each do |g|
      household_attending = household_attending + 1 if g.wedding == true
      household_attending = household_attending + 1 if g.breakfast == true
      household_attending = household_attending + 1 if g.welcome_party == true
    end
    if household_attending > 0
      true
    end
  end

  def household_name

    determine count of unique last names.
    count_uniq_lastnames = self.guests.lastname.uniq.count



    return household_name
  end

  def count_vegetarian()
    count_vegetarian = 0
    Guests.each do |g|
      count_vegetarian = count_vegetarian + 1 if g.vegetarian == true
    end
    count_vegetarian
  end

end
