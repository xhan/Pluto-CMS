class AddAppTypeColumn < ActiveRecord::Migration
  def self.up
    add_column :app_base_lites, :type, :string
  end

  def self.down
    remove_column :app_base_lites, :type
  end
end
