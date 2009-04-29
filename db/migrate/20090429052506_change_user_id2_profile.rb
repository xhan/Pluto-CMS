class ChangeUserId2Profile < ActiveRecord::Migration
  def self.up
    rename_column :forum_posts, :user_id, :forum_user_profile_id
    rename_column :forum_topics, :user_id, :forum_user_profile_id
  end

  def self.down
    rename_column :forum_topics, :forum_user_profile_id, :user_id
    rename_column :forum_posts, :forum_user_profile_id
  end
end
