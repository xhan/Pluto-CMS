class AddConnectTempletPageSticker < ActiveRecord::Migration
  def self.up
    # add_column :templets, :_sticker_nodes, :string
    # create_table :connect_sticker_and_page,:id => false , :force => true do |t| 
    #   t.string :sticker_node
    #   t.belongs_to :page    
    #   t.belongs_to :sticker
    #   t.integer :position
    #   t.
    #   t.timestamps
    # end
  end

  def self.down
    # drop_table :connect_sticker_and_page
    # remove_column :templets, :_sticker_nodes
  end
end
