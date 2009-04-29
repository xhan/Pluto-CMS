class CreateForumTopics < ActiveRecord::Migration
  def self.up
    create_table :forum_topics do |t|
      t.belongs_to :forum
      t.belongs_to :user
      t.string :title
      t.integer :type
      t.timestamps
    end
  end

  def self.down
    drop_table :forum_topics
  end
end
