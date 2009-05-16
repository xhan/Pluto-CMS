class CreatePages < ActiveRecord::Migration
  def self.up
     # create_versioned_table :pages do |t|
     create_table :pages do |t|
      t.string :name
      t.string :title
      t.string :path
      t.string :template
      t.boolean :hidden 
      t.timestamps
    end
  end

  def self.down
    # drop_versioned_table :pages
    drop_table :pages
  end
end
