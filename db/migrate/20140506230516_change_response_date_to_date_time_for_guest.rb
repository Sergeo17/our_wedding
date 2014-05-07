class ChangeResponseDateToDateTimeForGuest < ActiveRecord::Migration
  def change
  	change_column :guests, :response_date,  :datetime
  end
end
