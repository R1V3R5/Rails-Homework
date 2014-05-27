class CreateMeds < ActiveRecord::Migration
  def change
    create_table :meds do |t|
      t.integer :locations_id
      t.string :name
      t.string :cost
      t.text :description
      t.timestamps
    end
  end
end
