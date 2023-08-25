class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.string :description
      t.string :address
      t.date :birthday

      t.timestamps
    end
  end
end
