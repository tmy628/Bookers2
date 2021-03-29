class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.string :body
      t.string :book_id
      t.integer :user_id

      t.timestamps
    end
  end
end
