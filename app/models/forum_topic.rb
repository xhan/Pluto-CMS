# == Schema Information
# Schema version: 20090505082027
#
# Table name: forum_topics
#
#  id                    :integer(4)      not null, primary key
#  forum_id              :integer(4)
#  forum_user_profile_id :integer(4)
#  title                 :string(255)
#  type                  :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#

class ForumTopic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :profile, :class_name => "ForumUserProfile" , :foreign_key => "forum_user_profile_id" 
  has_many :posts, :class_name => "ForumPost" , :order => "created_at desc",  :dependent  => :destroy
                                           
  accepts_nested_attributes_for :posts
  # attr_accessor :name
  
  def last_post
    self.posts.last 
  end
end
