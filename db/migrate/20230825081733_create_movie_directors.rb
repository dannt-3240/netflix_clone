class CreateMovieDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_directors do |t|
      t.references :directorable, polymorphic: true, index: true
      t.references :director

      t.timestamps
    end
  end
end
