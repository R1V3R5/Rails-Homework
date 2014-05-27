class AddFieldsToLocations < ActiveRecord::Migration
  def change
       add_column :locations, :name,  :string
       add_column :locations, :phone_number, :string
  end
end
