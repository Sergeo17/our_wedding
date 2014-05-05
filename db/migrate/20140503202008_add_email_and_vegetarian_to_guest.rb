class AddEmailAndVegetarianToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :email, :string
    add_column :guests, :vegetarian, :boolean
  end
end
