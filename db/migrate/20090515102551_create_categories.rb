class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.references :categoryable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :categories
  end
end
