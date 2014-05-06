class DropRsvpDateFromGuests < ActiveRecord::Migration
  def change
  	remove_column :guests, :rsvp_date
  end
end
