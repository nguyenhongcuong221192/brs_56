class CreateHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.integer :page_number

      t.timestamps
    end
  end
end
