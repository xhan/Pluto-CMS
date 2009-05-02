class CreateStickerNodes < ActiveRecord::Migration
  def self.up
    create_table :sticker_nodes do |t|
      t.belongs_to :templet
      t.string :name
      t.timestamps
    end             
    add_index :sticker_nodes , :name
  end

  def self.down
    drop_table :sticker_nodes
  end
end
