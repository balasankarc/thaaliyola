class AddColoumnAuthor < ActiveRecord::Migration
  def up
    add_column :authors, :book_id, :integer
  end
end
