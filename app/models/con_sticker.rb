class ConSticker < ActiveRecord::Base
  
  validates_presence_of :sticker_node
  validates_presence_of :page
  validates_presence_of :sticker
  
  belongs_to :sticker_node
  belongs_to :page
  belongs_to :sticker
                  
  before_save :add_position
  
  def add_position
    
  end
end
