class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name
      t.string :path
      t.integer :parent_id
      t.integer :position
      t.boolean :hidden , :default => false
      t.boolean :is_url , :default  => false
      t.timestamps
    end
    Section.create(:name => "root"  ,:path => "/")
  end

  def self.down
    drop_table :sections
  end
end
