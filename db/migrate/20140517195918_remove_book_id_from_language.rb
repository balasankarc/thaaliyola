class RemoveBookIdFromLanguage < ActiveRecord::Migration
  def up
      remove_column :languages,:book_id
  end
end
