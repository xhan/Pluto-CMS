class AddStickerColumn < ActiveRecord::Migration
  def self.up       
    add_column :stickers, :app_id, :integer
    add_column :stickers, :action, :string
  end

  def self.down
    remove_column :stickers, :action
    remove_column :stickers, :app_id
  end
end
