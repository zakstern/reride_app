class AddAttachmentSidePictureToBikes < ActiveRecord::Migration
  def self.up
    change_table :bikes do |t|
      t.attachment :side_picture
    end
  end

  def self.down
    drop_attached_file :bikes, :side_picture
  end
end
