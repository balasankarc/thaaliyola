class ChangeColoumn < ActiveRecord::Migration
  def up
          rename_column :books, :author, :author_id
  end
end
