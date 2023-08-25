class CreateMovieProductions < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_productions do |t|
      t.references :productionable, polymorphic: true, index: true
      t.references :production

      t.timestamps
    end
  end
end
