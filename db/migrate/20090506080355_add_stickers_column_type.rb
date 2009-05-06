class AddStickersColumnType < ActiveRecord::Migration
  def self.up   
    add_column :stickers, :type, :string
  end

  def self.down
    remove_column :stickers, :type
  end
end
