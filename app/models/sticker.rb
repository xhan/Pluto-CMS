# == Schema Information
# Schema version: 20090502131506
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
   has_many :con_stickers
end
