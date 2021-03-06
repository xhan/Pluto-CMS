# == Schema Information
# Schema version: 20090505082027
#
# Table name: pages
#
#  id            :integer(4)      not null, primary key
#  version       :integer(4)
#  lock_version  :integer(4)      default(0)
#  name          :string(255)
#  title         :string(255)
#  path          :string(255)
#  templet_id    :string(255)
#  hidden        :boolean(1)
#  created_at    :datetime
#  updated_at    :datetime
#  published     :boolean(1)
#  deleted       :boolean(1)
#  archived      :boolean(1)
#  created_by_id :integer(4)
#  updated_by_id :integer(4)
#  section_id    :integer(4)
#  position      :integer(4)
#

class Page < ActiveRecord::Base             
  belongs_to :section          
  belongs_to :templet
  validates_presence_of :name, :title, :path ,:templet
  validates_format_of :name, :with => /\A[^\/]*\Z/, :message => "cannot contain '/'"
  validates_uniqueness_of :path
  named_scope :with_path ,lambda{|path| {:conditions => ['path = ?',path] }}
              
  has_many :con_stickers , :dependent => :destroy
  
=begin
  TODO after_destroy  : find a method to resort positions for exists pages ... (sections works same way)
=end  
  
  def before_save
    # mount = self.class.count(:conditions => {:section_id  => self.section_id  } )
    # position = mount + 1
    # mount = self.class.count(:conditions => {:section_id  => self.section_id  } ) + self.section.children.count
    
    position = self.section.child_size + 1
  end   
  
  # def after_destroy
  #   
  # end    
end
