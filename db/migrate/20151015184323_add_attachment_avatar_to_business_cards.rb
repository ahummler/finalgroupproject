class AddAttachmentAvatarToBusinessCards < ActiveRecord::Migration
  def self.up
    change_table :business_cards do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :business_cards, :avatar
  end
end
