class DropColoumnAuthorId < ActiveRecord::Migration
  def up
      remove_column :authors, :book_id
  end
end
