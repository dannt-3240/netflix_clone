class CreateMovieVideos < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_videos do |t|
      t.references :videoable, polymorphic: true
      t.string :video_url
      t.string :server_name
      t.integer :server_order

      t.timestamps
    end
  end
end
