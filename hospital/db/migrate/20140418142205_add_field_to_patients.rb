class AddFieldToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :description, :text
  end
end
