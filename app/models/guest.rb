class Guest < ActiveRecord::Base
  belongs_to :household
  validates_presence_of :firstname, :unless => :is_plus_one?
  validates_presence_of :lastname, :unless => :is_plus_one?

  def self.search(search)
    where('lastname like ? OR firstname like ?' , "%#{search}%", "%#{search}%")
  end

end
