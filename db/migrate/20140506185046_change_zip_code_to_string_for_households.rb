class ChangeZipCodeToStringForHouseholds < ActiveRecord::Migration
  def change
  	change_column :households, :zipcode,  :string
  end
end
