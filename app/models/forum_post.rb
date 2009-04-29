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
  # belongs_to :profile, :class_name => "ForumUserProfile"
  belongs_to :profile, :class_name => "ForumUserProfile", :foreign_key => "forum_user_profile_id"
  belongs_to :forum_user_profile, :class_name => "ForumUserProfile", :foreign_key => "forum_user_profile_id"
  def user
    self.profile.user
  end
end
