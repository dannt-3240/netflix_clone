class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :reviewable, polymorphic: true, index: true
      t.references :user
      t.string :title
      t.string :text
      t.date :post_date
      t.integer :liked, default: 0

      t.timestamps
    end
  end
end
