class AddToUser < ActiveRecord::Migration

    def up
        add_column :users, :address, :text
    add_column :users, :email, :string
    add_column :users, :phone, :string
    add_column :users, :validfrom, :date
    add_column :users, :validto, :date
    add_column :users, :book_id, :integer
    add_column :users, :dateissue, :date
    add_column :users, :datereturn, :date
    add_column :users, :totalfine, :float
    add_column :users, :photourl, :string
    end
end
