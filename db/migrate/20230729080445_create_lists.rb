class CreateLists < ActiveRecord::Migration[7.0]
  def change
    create_table :lists do |t|
      t.references :user
      t.string :name
      t.string :description
      t.string :image
      t.integer :order

      t.timestamps
    end
  end
end
