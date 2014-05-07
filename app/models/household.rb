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
      Household.joins(:guests).where('lower(lastname) like lower(?) or lower(firstname) like lower(?)', "%#{search}%", "%#{search}%" )
    else
      all
    end
  end


  def count()
    #x=Household.joins(:guests).where('id = ? AND is_plus_one = ? AND wedding = ?', "#{household}", false, true)
    #x.count

    count_guests = 0
    count_attending = 0
    count_plus_one = 0

    self.guests.each do |g|
        count_attending = count_attending + 1 if g.wedding?
        count_guests = count_guests + 1
        count_plus_one = count_plus_one + 1 if g.is_plus_one?
    end

    [count_guests, cou]



  end

  def has_plus_one()
    has_plus_one = 0
    self.guests.each do |g|
      has_plus_one = has_plus_one + 1 if g.is_plus_one?
    end
    has_plus_one
  end

  def count_vegetarian()
    count_vegetarian = 0
    Guests.each do |g|
      count_vegetarian = count_vegetarian + 1 if g.vegetarian == true
    end
    count_vegetarian
  end

end
