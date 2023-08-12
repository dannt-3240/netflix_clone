class CreateTvEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_episodes do |t|

      t.timestamps
    end
  end
end
