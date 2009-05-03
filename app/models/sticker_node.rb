# == Schema Information
# Schema version: 20090502131506
#
# Table name: sticker_nodes
#
#  id         :integer(4)      not null, primary key
#  templet_id :integer(4)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class StickerNode < ActiveRecord::Base    
  belongs_to :templet
  named_scope :with_name , lambda{|name| {:conditions => ['name = ?',name] }}
end
