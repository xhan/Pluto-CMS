class CreateConStickers < ActiveRecord::Migration
  def self.up
    create_table :con_stickers do |t|
      t.belongs_to :sticker_node
      t.belongs_to :page
      t.belongs_to :sticker
      t.integer :position
      t.timestamps
    end
    add_index :con_stickers,[:sticker_node,:sticker, :page]
  end

  def self.down
    drop_table :con_stickers
  end
end
