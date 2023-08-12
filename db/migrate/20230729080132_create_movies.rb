class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :description
      t.float :imdb
      t.float :rating
      t.string :poster
      t.string :thumbnail
      t.integer :liked
      t.integer :watched
      t.integer :duration
      t.string :country
      t.integer :release_year
      t.string :video_url
      t.integer :rank
      t.integer :movie_type

      t.timestamps
    end
  end
end
