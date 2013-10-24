class AddAttachmentSidePictureToQuotes < ActiveRecord::Migration
  def self.up
    change_table :quotes do |t|
      t.attachment :side_picture
    end
  end

  def self.down
    drop_attached_file :quotes, :side_picture
  end
end
