class ReConTAble < ActiveRecord::Migration
  def self.up
    add_column :con_stickers, :refer_type , :string
    rename_column :con_stickers, :sticker_id, :refer_id
  end

  def self.down
    rename_column :con_stickers, :refer_id, :sticker_id
    remove_column :con_stickers, :refer_type
  end
end
