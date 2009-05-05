# == Schema Information
# Schema version: 20090505082027
#
# Table name: con_stickers
#
#  id              :integer(4)      not null, primary key
#  sticker_node_id :integer(4)
#  page_id         :integer(4)
#  sticker_id      :integer(4)
#  position        :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class ConSticker < ActiveRecord::Base
  
  validates_presence_of :sticker_node
  validates_presence_of :page
  validates_presence_of :sticker
  
  belongs_to :sticker_node
  belongs_to :page
  belongs_to :sticker
           
  named_scope :stickers_in_page , lambda{|node_id,page_id| {:conditions => {:sticker_node_id => node_id,:page_id => page_id }, :order  => 'position' }}                 
  named_scope :with_page_id , lambda{|page_id| {:conditions => {:page_id => page_id} ,:order  => 'position'}}
 # TODO  seems that  before_save does not work , using  function before_save instead
#  before_save :add_position

  # def links()
  #   
  # end 
  
  def before_save
    add_position
  end           
  
  
  def add_position
    amount = self.class.stickers_in_page(self.sticker_node_id,self.page_id).count
    self.position = amount + 1
  end
  
  class << self
    
    # def stickers_in_page(id,page)
    #   find_all(:conditions => {:sticker_node_id => id,:page => page } , :order  => 'position' )
    # end    
    
  end
  
  

  
end
   
