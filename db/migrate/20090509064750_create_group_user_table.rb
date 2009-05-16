class CreateGroupUserTable < ActiveRecord::Migration
  def self.up 
    create_table :groups_users, :force => true , :id => false do |t|
      t.belongs_to :group
      t.belongs_to :user
      t.timestamps
    end                  
    add_index :groups_users, :group_id
    add_index :groups_users, :user_id
  end

  def self.down
    remove_index :groups_users, :user_id
    remove_index :groups_users, :group_id
    mind
    drop_table :groups_users
  end
end
