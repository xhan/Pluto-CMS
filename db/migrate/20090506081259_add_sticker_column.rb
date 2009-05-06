class AddStickerColumn < ActiveRecord::Migration
  def self.up       
    add_column :stickers, :app_id, :integer
  end

  def self.down
    remove_column :stickers, :app_id
  end
end
