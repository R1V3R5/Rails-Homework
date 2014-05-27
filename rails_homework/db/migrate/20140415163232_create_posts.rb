class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :entry
      t.timestamps
    end
  end
end
