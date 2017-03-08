class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :category
      t.integer :price
      t.integer :rate
      t.integer :favorite

      t.timestamps
    end
  end
end
