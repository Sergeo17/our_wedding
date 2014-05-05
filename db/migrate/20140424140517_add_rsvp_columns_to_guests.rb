class AddRsvpColumnsToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :welcome_party, :boolean
    add_column :guests, :wedding, :boolean
    add_column :guests, :breakfast, :boolean
  end
end
