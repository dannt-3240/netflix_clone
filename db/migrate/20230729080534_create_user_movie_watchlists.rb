class CreateUserMovieWatchlists < ActiveRecord::Migration[7.0]
  def change
    create_table :user_movie_watchlists do |t|
      t.references :movie
      t.references :user
      t.integer :duration_watch

      t.timestamps
    end
  end
end
