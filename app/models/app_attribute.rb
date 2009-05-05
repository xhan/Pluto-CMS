# == Schema Information
# Schema version: 20090505082027
#
# Table name: app_attributes
#
#  id         :integer(4)      not null, primary key
#  app_id     :integer(4)
#  name       :string(255)
#  type       :string(255)
#  hidden     :boolean(1)
#  link_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AppAttribute < ActiveRecord::Base
  belongs_to :app
  validates_presence_of :app_id, :on => :create, :message => "can't be blank"
  validates_presence_of :name , :type , :link_name                                       
  
  named_scope :visibles , :conditions => {:hidden => false}
  named_scope :hiddens ,  :conditions => {:hidden => true}
end
