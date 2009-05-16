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
  validates_presence_of :refer
  
  belongs_to :sticker_node
  belongs_to :page
  belongs_to :refer , :polymorphic => true
           
  named_scope :stickers_in_page , lambda{|node_id,page_id| {:conditions => {:sticker_node_id => node_id,:page_id => page_id }, :order  => 'position' }}                 
  named_scope :with_page_id , lambda{|page_id| {:conditions => {:page_id => page_id} ,:order  => 'position'}}
 
  
  def before_create
    self.add_position
  end           
  
  #issue : when destroy a record ,new record will got a exist position 
  # def add_position
  #   amount = self.class.stickers_in_page(self.sticker_node_id,self.page_id).count
  #   self.position = amount + 1
  # end 

  #   change to get maximun number of position  of record  
  
  
=begin
  TODO add  act_as_list plugin methods 
=end      
  def add_position
    self.position = self.max_position + 1
  end
                                          
  def pre_node
    brothers.find(:last,:conditions => ["position < ?",self.position] )
  end
  
  def next_node
    brothers.find(:first,:conditions => ["position > ?",self.position] )
  end
  
  def brothers
    self.class.stickers_in_page(self.sticker_node_id,self.page_id)
  end         
    
  def max_position
    self.class.stickers_in_page(self.sticker_node_id,self.page_id).maximum(:position)
  end                                                                                
  
  def move_pre      
    pre = self.pre_node
    if pre
       self.position , pre.position = pre.position , self.position
       save
       pre.save
       true
     else
       false
    end
  end         
  
  def move_next
    n = self.next_node
    if n
       self.position , n.position = n.position , self.position
       save
       n.save
       true
     else
       false
    end
  end  
  
  class << self
    
    # def stickers_in_page(id,page)
    #   find_all(:conditions => {:sticker_node_id => id,:page => page } , :order  => 'position' )
    # end    
    
  end
  
  

  
end
   
