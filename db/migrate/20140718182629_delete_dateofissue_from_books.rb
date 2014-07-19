class DeleteDateofissueFromBooks < ActiveRecord::Migration
  def change
      remove_column :books,:dateofissue
      remove_column :books,:dateofreturn
  end
end
