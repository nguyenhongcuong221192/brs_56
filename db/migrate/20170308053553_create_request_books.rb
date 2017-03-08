class CreateRequestBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :request_books do |t|
      t.references :request, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
