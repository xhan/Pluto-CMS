class AddColumnApp < ActiveRecord::Migration
  def self.up
    add_column :apps, :edit_block, :text
    add_column :apps, :show_block, :text
    add_column :apps, :list_block, :text
    add_column :apps, :type, :integer
  end

  def self.down
    remove_column :apps, :type
    remove_column :apps, :list_block
    remove_column :apps, :show_block
    remove_column :apps, :edit_block
  end
end
