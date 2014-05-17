class AddLanguageIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :language_id, :integer
  end
end
