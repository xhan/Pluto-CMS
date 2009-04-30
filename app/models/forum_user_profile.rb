# == Schema Information
# Schema version: 20090430105951
#
# Table name: forum_user_profiles
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  signarea   :string(255)
#  is_active  :boolean(1)
#  website    :string(255)
#  about_me   :string(255)
#  time_zone  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ForumUserProfile < ActiveRecord::Base
  has_many :posts, :class_name => "ForumPost"
  has_many :topics, :class_name => "ForumTopic"
  belongs_to :user
end
