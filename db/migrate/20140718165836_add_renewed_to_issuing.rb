class AddRenewedToIssuing < ActiveRecord::Migration
  def change
      add_column :issuings, :renewed, :boolean
  end
end
