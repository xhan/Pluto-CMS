class AddStickerNameDesc < ActiveRecord::Migration
  def self.up
    add_column :stickers, :name, :string
    add_column :stickers, :description, :text
  end

  def self.down
    remove_column :stickers, :description
    remove_column :stickers, :name
  end
end
