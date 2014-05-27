class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :hospital_id
      t.integer :patient_id
      t.timestamps
    end
  end
end
