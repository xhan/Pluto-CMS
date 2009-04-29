class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login , :limit => 40
      t.string :email , :limit => 40
      t.string :crypted_password , :limit  => 40  
      t.string :salt , :limit => 40
      t.string :remember_token, :limit => 40
      t.datetime :expires_at
      t.datetime :remember_token_expires_at      
      t.timestamps
    end
    add_index :users, :login, :unique  => true
  end

  def self.down
    drop_table :users
  end
end
