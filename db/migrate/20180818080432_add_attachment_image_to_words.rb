class AddAttachmentImageToWords < ActiveRecord::Migration[5.2]
  def self.up
    change_table :words do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :words, :image
  end
end
