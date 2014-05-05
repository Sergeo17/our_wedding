class CreateHouseholds < ActiveRecord::Migration
  def change
    create_table :households do |t|
      t.string :addressline1
      t.string :addressline2
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
