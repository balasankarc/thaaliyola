class AddAvailableToIssuing < ActiveRecord::Migration
  def change
      add_column :reservations,:available,:boolean
  end
end
