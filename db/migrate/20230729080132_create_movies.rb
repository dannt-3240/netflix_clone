class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.float :imdb
      t.float :rating, default: 0
      t.integer :liked, default: 0
      t.integer :watched, default: 0
      t.integer :duration
      t.string :country
      t.integer :release_year
      t.integer :rank, default: 0
      t.integer :movie_type, default: 0

      t.timestamps
    end
  end
end
