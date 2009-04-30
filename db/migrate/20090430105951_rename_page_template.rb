class RenamePageTemplate < ActiveRecord::Migration
  def self.up  
    rename_column :pages, :template, :templet_id
  end

  def self.down
    rename_column :pages, :templet_id, :template
  end
end
