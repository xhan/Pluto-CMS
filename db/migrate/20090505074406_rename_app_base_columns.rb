class RenameAppBaseColumns < ActiveRecord::Migration
  def self.up
    rename_column :app_bases, :app_name, :type
    add_index :app_bases , :type
  end

  def self.down
    rename_column :app_bases, :type
  end
end
