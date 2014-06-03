class Guest < ActiveRecord::Base
  belongs_to :household
  validates_presence_of :lastname, :on => :create, :unless => :is_plus_one?, :message => "Last Name is Required."
  validates_presence_of :lastname, :on => :update, unless: "plus_one_declined == true", :message => "Please let us know the last name of your guest."
  validates_presence_of :firstname, :on => :create, :unless => :is_plus_one?, :message => "First Name is Required."
  validates_presence_of :firstname, :on=> :update, unless: "plus_one_declined == true", :message => "Please let us know the first name of your guest."
  validates_inclusion_of :shuttle, :in => [true, false], :if => :wedding?, :message => 'Can you please let us know if you are going to ride the shuttle.'
  validates_inclusion_of :welcome_party, :in => [true, false], :on => :update, unless: "plus_one_declined == true" , :message => "Please let us know if you will attend the Welome Party."
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

  def self.count_plus_one
    count_plus_one = 0
    Guest.all.each do |g|
      count_plus_one = count_plus_one + 1 if g.is_plus_one == true
    end
    count_plus_one
  end

  def self.count_vegetarian
    count_vegetarian = 0
    Guest.all.each do |g|
      count_vegetarian = count_vegetarian + 1 if g.vegetarian == true
    end
    count_vegetarian
  end

  def self.count_shuttle
    count_shuttle = 0
    Guest.all.each do |g|
      count_shuttle = count_shuttle + 1 if g.shuttle == true
    end
    count_shuttle
  end

  def self.count_wedding
    count_wedding = 0
    Guest.all.each do |g|
      count_wedding = count_wedding + 1 if g.wedding == true
    end
    count_wedding
  end

  def self.count_plus_one_wedding
    count_plus_one_wedding = 0
    Guest.all.each do |g|
      count_plus_one_wedding = count_plus_one_wedding + 1 if g.wedding == true && g.is_plus_one == true
    end
    count_plus_one_wedding
  end

  def self.count_welcome_party
    count_welcome_party = 0
    Guest.all.each do |g|
      count_welcome_party = count_welcome_party + 1 if g.welcome_party == true
    end
    count_welcome_party
  end

  def self.count_breakfast
    count_breakfast = 0
    Guest.all.each do |g|
      count_breakfast = count_breakfast + 1 if g.breakfast == true
    end
    count_breakfast
  end

  def self.count_responses
    count_responses = 0
    Guest.all.each do |g|
      count_responses = count_responses + 1 if g.response_date?
    end
    count_responses
  end




end
