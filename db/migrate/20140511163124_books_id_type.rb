class BooksIdType < ActiveRecord::Migration
  def up
      change_column :books, :author_id, :integer
  end
end
