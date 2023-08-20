class CreateTvEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_episodes do |t|
      t.references :movie
      t.string :name
      t.string :title
      t.integer :order
      t.date :release_date
      t.string :tv_season_title
      t.integer :tv_seasion_order

      t.timestamps
    end
  end
end
