class AddFieldsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :phone_number, :string
    add_column :patients, :email , :string
    add_column :patients, :address1 , :string
    add_column :patients, :address2 , :string
    add_column :patients, :city , :string
    add_column :patients, :state , :string
    add_column :patients, :zip , :string
    add_column :patients, :weight , :string
    add_column :patients, :height , :string
    add_column :patients, :workflow_state, :string
  end
end
