class CreateTvSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :tv_series do |t|

      t.timestamps
    end
  end
end
