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
  validates_uniqueness_of :name
  
  TEMPLET_FOLDER = "cms_templets"
  TEMPLET_PATH = "#{RAILS_ROOT}/app/views/layouts/#{TEMPLET_FOLDER}"
  PATTERN_TAG =  /<%=\s*sticker_tag.*?%>/m
  PATTERN_BLOCK = /<%\s*sticker_tag.*?do.*?<%.*?end.*?%>/m
  
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
           
  # make sure the stickers in templet was valid .
  def make_stickers
    
    @sticker_nodes =[]
    # sticker_tags = self.content.scan(PATTERN_TAG)
    # sticker_tags.each do |sticker|
      self.content.gsub!(PATTERN_TAG) do |sticker|
         generate_identify_tag(sticker)
      end
    
  end                
  
  private                    
  #str to be checked
  def generate_identify_tag str  
     par = str.sub(/.*?sticker_tag\s*/,'').sub(/\s*%>/,'').chomp
     if par.blank?                      # no args
         "<%= sticker_tag #{id}%>"
       elsif par[/\W+/].size == 0       # no invalid , * in args . just one arg
         @sticker_nodes.push par
         str                            #do nothing
       else                             # raise errors
         raise TypeError,"#{str} 语法错误"
     end
  end 
  
  def generate_id
    id = "ID_#{(rand*1_000_000).to_i}_" 
     while @sticker_nodes.include? id
       id = "ID_#{(rand*1_000_000).to_i}_" 
     end 
     @sticker_nodes.push id   
     return id   
     
  end
  
end
