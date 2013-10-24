class AddAttachmentFrontPictureToQuotes < ActiveRecord::Migration
  def self.up
    change_table :quotes do |t|
      t.attachment :front_picture
    end
  end

  def self.down
    drop_attached_file :quotes, :front_picture
  end
end
