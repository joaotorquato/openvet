class AddAttachmentPhotoToPets < ActiveRecord::Migration
  def self.up
    change_table :pets do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :pets, :photo
  end
end
