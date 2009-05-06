class AddPublishedAt < ActiveRecord::Migration
  def self.up
    add_column :apps, :published_at, :datetime
  end

  def self.down
    remove_column :apps, :published_at
  end
end
