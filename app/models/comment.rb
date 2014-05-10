class Comment < ActiveRecord::Base
  belongs_to :household
  has_many :guests, :through => :household



end
