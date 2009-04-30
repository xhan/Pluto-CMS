# == Schema Information
# Schema version: 20090430105951
#
# Table name: sections
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  path       :string(255)
#  parent_id  :integer(4)
#  position   :integer(4)
#  hidden     :boolean(1)
#  is_url     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class Section < ActiveRecord::Base
  
  acts_as_tree :order => :position
  has_many :pages, :order => "position"
  validates_presence_of :name,:path
  validates_format_of :name, :with => /\A[^\/]*\Z/, :message => "cannot contain '/'"
  
  def before_save
    self.position = Section.count(:conditions => {:parent_id => self.parent}) + 1  
  end              
  
end
