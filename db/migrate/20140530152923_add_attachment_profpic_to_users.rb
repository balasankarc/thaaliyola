class AddAttachmentProfpicToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profpic
    end
  end

  def self.down
    drop_attached_file :users, :profpic
  end
end
