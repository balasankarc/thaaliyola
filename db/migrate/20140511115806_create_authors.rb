class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :serial
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
