class Guest < ActiveRecord::Base
  belongs_to :household
  validates_presence_of :lastname, :on => :create, :unless => :is_plus_one?, :message => "Last Name is Required."
  validates_presence_of :lastname, :on => :update, unless: "plus_one_declined == true", :message => "Please let us know the last name of your guest."
  validates_presence_of :firstname, :on => :create, :unless => :is_plus_one?, :message => "First Name is Required."
  validates_presence_of :firstname, :on=> :update, unless: "plus_one_declined == true", :message => "Please let us know the first name of your guest."
  validates_inclusion_of :shuttle, :in => [true, false], :if => :wedding?, :message => 'Can you please let us know if you are going to ride the shuttle.'
  validates_inclusion_of :welcome_party, :in => [true, false], :on => :update, unless: "plus_one_declined == true", :message => "Please let us know if you will attend the Welome Party."
  validates_inclusion_of :wedding, :in => [true, false], :on => :update, unless: "plus_one_declined == true", :message => "Please let us know if can make it to our Wedding."
  validates_inclusion_of :breakfast, :in => [true, false], :on => :update, unless: "plus_one_declined == true", :message => "Please let us know if you will make it to Farewell Bagels."

  def self.admin_search(search)
    Household.joins(:guests).where('lower(lastname) like lower(?) or lower(firstname) like lower(?)', "%#{search}%", "%#{search}%" )
  end

  def has_plus_one()
    has_plus_one = 0
    self.guests.each do |g|
      has_plus_one = has_plus_one + 1 if g.is_plus_one?
    end
    has_plus_one
  end

  def plus_one_count()
    count_plus_ones = 0
    Guests.each do |g|
      count_plus_ones = count_plus_ones + 1 if g.is_plus_one == true
    end
    count_plus_ones
  end

  def count_vegetarian()
    count_vegetarian = 0
    Guests.each do |g|
      count_vegetarian = count_vegetarian + 1 if g.vegetarian == true
    end
    count_vegetarian
  end

end
