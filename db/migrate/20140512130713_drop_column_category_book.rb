class DropColumnCategoryBook < ActiveRecord::Migration
  def up
      remove_column :books, :category
  end
end
