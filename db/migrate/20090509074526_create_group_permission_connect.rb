class CreateGroupPermissionConnect < ActiveRecord::Migration
  def self.up
    create_table :groups_permissions, :force => true , :id => false do |t|
      t.belongs_to :group
      t.belongs_to :permission
      t.timestamps
    end                                                            
    add_index :groups_permissions, :group_id   
    add_index :groups_permissions, :permission_id
  end

  def self.down
    remove_index :groups_permissions, :permission_id
    remove_index :groups_permissions, :group_id
    drop_table :groups_permissions
  end
end
