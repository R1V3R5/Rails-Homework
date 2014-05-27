class AddFieldToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :email, :string
  end
end
