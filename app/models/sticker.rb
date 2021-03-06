# == Schema Information
# Schema version: 20090505082027
#
# Table name: stickers
#
#  id           :integer(4)      not null, primary key
#  content      :text
#  user_id      :integer(4)
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Sticker < ActiveRecord::Base
   validates_presence_of :content
   validates_presence_of :name
   has_many :con_stickers , :as => :refer
   has_many :pages , :through => :con_stickers
   belongs_to :user           
   
   
   def page_count
    con_stickers.count
   end                
   
   # def pages
   #  con_stickers.map(&:page)
   # end                      
   
end
