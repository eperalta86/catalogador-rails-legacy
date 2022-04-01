class AddAttachmentCoverToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :cover
    end
  end

  def self.down
    drop_attached_file :items, :cover
  end
end
