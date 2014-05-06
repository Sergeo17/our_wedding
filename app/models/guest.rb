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

  def self.search(search)
    where('lastname like ? OR firstname like ?' , "%#{search}%", "%#{search}%")
  end

end
