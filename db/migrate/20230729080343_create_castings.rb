class CreateCastings < ActiveRecord::Migration[7.0]
  def change
    create_table :castings do |t|
      t.references :castingable, polymorphic: true, index: true
      t.references :actor

      t.timestamps
    end
  end
end
