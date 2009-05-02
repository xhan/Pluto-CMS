class CreateStickerNodes < ActiveRecord::Migration
  def self.up
    create_table :sticker_nodes do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :sticker_nodes
  end
end
