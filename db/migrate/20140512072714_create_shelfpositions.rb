class CreateShelfpositions < ActiveRecord::Migration
  def change
    create_table :shelfpositions do |t|
      t.integer :book_id
      t.integer :shelf_id

      t.timestamps
    end
  end
end
