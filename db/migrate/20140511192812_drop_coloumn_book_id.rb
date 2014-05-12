class DropColoumnBookId < ActiveRecord::Migration
  def up
      remove_column :books, :author_id
  end
end
