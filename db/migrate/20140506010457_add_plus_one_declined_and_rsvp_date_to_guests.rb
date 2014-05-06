class AddPlusOneDeclinedAndRsvpDateToGuests < ActiveRecord::Migration
  def change
  	add_column :guests, :plus_one_declined, :boolean
    add_column :guests, :rsvp_date, :date
  end
end
