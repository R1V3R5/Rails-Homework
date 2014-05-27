class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :location_id
      t.string :name
      t.string :phone_number
      t.text :description
      t.string :workflow_state
      t.timestamps
    end
  end
end
