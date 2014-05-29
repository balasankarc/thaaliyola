class AddDateofissueDateofreturnToIssuings < ActiveRecord::Migration
  def change
    add_column :issuings, :dateofissue, :date
    add_column :issuings, :dateofreturn, :date
  end
end
