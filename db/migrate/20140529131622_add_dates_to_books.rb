class AddDatesToBooks < ActiveRecord::Migration
  def change
    add_column :books, :dateofissue, :date
    add_column :books, :dateofreturn, :date
  end
end
