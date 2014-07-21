class AddBookuniqueToBooks < ActiveRecord::Migration
  def change
      add_column :books,:bookunique,:string
  end
end
