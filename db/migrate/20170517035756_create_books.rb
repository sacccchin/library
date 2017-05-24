class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author_name
      t.datetime :released_date

      t.timestamps
    end
  end
end