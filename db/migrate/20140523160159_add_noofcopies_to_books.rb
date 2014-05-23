class AddNoofcopiesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :noofcopies, :integer
  end
end
