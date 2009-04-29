# == Schema Information
# Schema version: 20090429052506
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
  belongs_to :profile, :class_name => "ForumUserProfile"
  has_many :posts, :class_name => "ForumPost" , :dependent  => :destroy
  validates_presence_of :name                                           
  attr_accessor :name
end
