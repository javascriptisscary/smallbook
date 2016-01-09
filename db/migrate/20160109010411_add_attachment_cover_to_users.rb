class AddAttachmentCoverToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :users, :cover
  end
end
