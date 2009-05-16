class AddSectionIdentify < ActiveRecord::Migration
  def self.up  
    add_column :sections, :name_uniq, :string
    add_index :sections, :name_uniq
  end

  def self.down
    remove_index :sections, :name_uniq
    remove_column :sections, :name_uniq
  end
end
