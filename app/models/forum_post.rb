# == Schema Information
# Schema version: 20090429052506
#
# Table name: forum_posts
#
#  id                    :integer(4)      not null, primary key
#  forum_topic_id        :integer(4)
#  body                  :text
#  forum_user_profile_id :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#

class ForumPost < ActiveRecord::Base
  belongs_to :topic, :class_name => "ForumTopic"
  belongs_to :profile, :class_name => "ForumUserProfile"
end
