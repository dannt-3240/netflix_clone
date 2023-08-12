class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user
      t.string :content
      t.timestamp :send_time
      t.boolean :readed

      t.timestamps
    end
  end
end
