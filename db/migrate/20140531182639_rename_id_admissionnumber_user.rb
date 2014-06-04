class RenameIdAdmissionnumberUser < ActiveRecord::Migration
  def change
      rename_column :users, :id, :admissionnumber
  end
end
