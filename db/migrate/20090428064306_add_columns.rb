class AddColumns < ActiveRecord::Migration
  def self.up      
    add_column :pages, :section_id, :integer  
    add_column :pages, :position, :integer
  end

  def self.down
    remove_column :pages, :position
    remove_column :pages, :section_id
  end
end
