class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :release_year, :string
    add_column :movies, :genre, :string
    add_column :movies, :rating, :string
    add_column :movies, :runtime, :string
    add_column :movies, :actors, :text
    add_column :movies, :favorite, :boolean
  end
end
