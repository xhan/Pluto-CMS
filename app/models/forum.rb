# == Schema Information
# Schema version: 20090502131506
#
# Table name: forums
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  description :text
#  position    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class Forum < ActiveRecord::Base  
  
  has_many :topics, :class_name => "ForumTopic" , :order => "updated_at desc" , :dependent => :destroy
  has_many :posts , :through => :topics
     
  validates_presence_of :name,:description
   # attr_accessor :name,:description
  
  def before_save
    position = Forum.count(:position)+1
  end
  
  def to_param
     "#{self.id}-#{self.name.to_slug_url}"
   end     
end
