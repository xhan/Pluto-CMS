class CreateAppAttributes < ActiveRecord::Migration
  def self.up
    create_table :app_attributes do |t|
      t.references :app
      t.string :name
      t.string :type
      t.boolean :hidden , :default => false 
      t.string :link_name
      t.timestamps
    end
  end

  def self.down
    drop_table :app_attributes
  end
end
