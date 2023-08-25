class CreateMovieCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_countries do |t|
      t.references :countryable, polymorphic: true, index: true
      t.references :country

      t.timestamps
    end
  end
end
