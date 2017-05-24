class CreateBorrows < ActiveRecord::Migration[5.1]
  def change
    create_table :borrows do |t|
      t.string :resident
      t.datetime :borrowed_date
      t.datetime :return_date
      t.boolean :is_approved, default: false
      t.boolean :is_returned, default: false
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
