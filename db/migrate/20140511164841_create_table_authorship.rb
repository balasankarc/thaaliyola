class CreateTableAuthorship < ActiveRecord::Migration
  def change
    create_table :authorships do |t|
        t.integer :book_id
        t.integer :author_id
        t.datetime :created_at
        t.datetime :updated_at
    end
  end
end
