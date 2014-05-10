class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :serial
      t.string :name
      t.string :author
      t.string :category
      t.string :shelf
      t.string :row

      t.timestamps
    end
  end
end
