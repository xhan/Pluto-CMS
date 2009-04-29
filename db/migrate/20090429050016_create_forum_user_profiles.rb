class CreateForumUserProfiles < ActiveRecord::Migration
  def self.up
    create_table :forum_user_profiles do |t|
      t.belongs_to :user
      t.string :signarea
      t.boolean :is_active,:default => false   
      t.string :website
      t.string :about_me
      t.string :time_zone , :defalut => "UTC"
      t.timestamps
    end
  end

  def self.down
    drop_table :forum_user_profiles
  end
end
