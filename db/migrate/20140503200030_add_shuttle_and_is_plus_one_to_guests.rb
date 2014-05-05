class AddShuttleAndIsPlusOneToGuests < ActiveRecord::Migration
  def change
    add_column :guests, :shuttle, :boolean
    add_column :guests, :is_plus_one, :boolean
  end
end

