class CreateTvEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_episodes do |t|
      t.references :tv_serie
      t.string :name
      t.integer :order, default: 0
      t.date :release_date
      t.string :tv_season_title
      t.integer :tv_season_order, default: 0

      t.timestamps
    end
  end
end
