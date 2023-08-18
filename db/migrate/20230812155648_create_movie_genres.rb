class CreateMovieGenres < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_genres do |t|
      t.references :movie
      t.references :genre

      t.timestamps
    end
  end
end
