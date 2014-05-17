class AddAdmissionnumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :admissionnumber, :string
  end
end
