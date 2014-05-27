class Location < ActiveRecord::Migration
  def change
    remove_column :locations, :hospital_id, :integer
    add_column :locations, :hospital_id, :integer
  end
end
