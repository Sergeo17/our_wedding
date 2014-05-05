class Household < ActiveRecord::Base

  has_many :guests
  has_many :comments
  accepts_nested_attributes_for :guests, allow_destroy: true
  accepts_nested_attributes_for :comments

  def self.search(search, zipcode)
    Household.joins(:guests).where('lower(lastname) = lower(?) AND zipcode = ? AND is_plus_one = ?' , "#{search}", "#{zipcode}", false)
  end

  def attending( household )
    x=Household.joins(:guests).where('id = ? AND is_plus_one = ? AND wedding = ?', "#{household}", false, true)
    x.count
  end

  def has_plus_one( household )
    x=Household.joins(:guests).where('id = ? and is_plus_one = ?', "#{household}", true)
    x.count
  end

end
