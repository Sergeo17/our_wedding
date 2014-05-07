class AddResponseDateToGuest < ActiveRecord::Migration
  def change
  	add_column :guests, :response_date, :date
  end
end
