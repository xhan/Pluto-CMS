class CreateStickers < ActiveRecord::Migration
  def self.up
    create_table :stickers do |t|
      # t.belongs_to :page
      t.text :content
      t.belongs_to :user
      t.datetime :published_at
      t.timestamps
    end
    # add_column :pages, :sticker_id, :integer
  end

  def self.down
    # remove_column :pages, :sticker_id
    drop_table :stickers
  end
end
