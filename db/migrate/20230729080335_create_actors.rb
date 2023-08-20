class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :description
      t.string :address
      t.date :birthday

      t.timestamps
    end
  end
end
