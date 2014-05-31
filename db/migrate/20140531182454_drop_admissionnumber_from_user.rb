class DropAdmissionnumberFromUser < ActiveRecord::Migration
  def change
      remove_column :users, :admissionnumber
  end
end
