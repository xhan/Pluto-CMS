class AddAppName < ActiveRecord::Migration
 def self.up
   add_column :app_bases, :app_name, :string
 end
 
 def self.down
   remove_column :app_bases, :app_name
 end    
end
