class DefaultLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :hospital_id, :integer
    add_column :locations, :hospital_id, :integer, default: 1
  end
end
