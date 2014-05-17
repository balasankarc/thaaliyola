class CreateLanguagedivisions < ActiveRecord::Migration
  def change
    create_table :languagedivisions do |t|
      t.integer :book_id
      t.integer :language_id

      t.timestamps
    end
  end
end
