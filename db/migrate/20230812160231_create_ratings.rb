class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :ratingable, polymorphic: true, index: true
      t.references :user
      t.integer :value

      t.timestamps
    end
  end
end
