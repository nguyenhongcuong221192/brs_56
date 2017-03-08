class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :review_title
      t.text :review_content

      t.timestamps
    end
  end
end
