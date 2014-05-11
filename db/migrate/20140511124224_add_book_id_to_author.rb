class AddBookIdToAuthor < ActiveRecord::Migration
    def self.up
        add_column :authors, :book_id, :integer
    end    
end
