class RemoveColumnsFromMeds < ActiveRecord::Migration
  def change
    remove_column :meds, :locations_id, :integer
  end
end
