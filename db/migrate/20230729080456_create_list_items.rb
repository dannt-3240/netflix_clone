class CreateListItems < ActiveRecord::Migration[7.0]
  def change
    create_table :list_items do |t|
      t.references :list
      t.references :movie
      t.integer :order
      t.timestamps
    end
  end
end
