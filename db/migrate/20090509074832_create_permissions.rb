class CreatePermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions do |t|
      t.string :name
      t.text :description
      t.timestamps
    end                                                                      
    
    Permission.create(:name => "admin" , :description => "cms_admin")
    Permission.create(:name => "view" , :description => "view content")
    Permission.create(:name => "edit" , :description => "edit content")
    Permission.create(:name => "publish" , :description => "publish content")    
  end
  

  def self.down
    drop_table :permissions
  end
end
