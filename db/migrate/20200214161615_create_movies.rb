class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :creation_year
      t.string :genre
      t.references :studio, foreign_key: true
    end
  end
end
