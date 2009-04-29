class CreateTemplets < ActiveRecord::Migration
  def self.up
    create_table :templets do |t|
      t.string :name
      t.string :description
      t.text :content
      t.datetime :published_at
      t.timestamps
    end
  end

  def self.down
    drop_table :templets
  end
end
