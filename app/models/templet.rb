# == Schema Information
# Schema version: 20090430105951
#
# Table name: templets
#
#  id           :integer(4)      not null, primary key
#  name         :string(255)
#  description  :string(255)
#  content      :text
#  published_at :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

class Templet < ActiveRecord::Base       
  validates_presence_of :name , :content     
  validates_format_of :name, :with => /\A[^\/]*\Z/, :message => "cannot contain '/'"
  TEMPLET_FOLDER = "cms_templets"
  TEMPLET_PATH = "#{RAILS_ROOT}/app/views/layouts/#{TEMPLET_FOLDER}"

  
  # publish contents to exist file as a layout template
  def publish!
    return false if self.new_record?   
    Dir.mkdir TEMPLET_PATH unless File.exist? TEMPLET_PATH
    
    open "#{TEMPLET_PATH}/#{self.name}.html.erb","w" do |file|
      file.puts self.content
    end
  # rescue
    update_attribute :published_at ,Time.now
  end # publish!                               
                
  def layout_path
    TEMPLET_FOLDER + '/' + name + '.html.erb'
  end
      
  def search_stickers
    # self.content.
  end                
  
end
