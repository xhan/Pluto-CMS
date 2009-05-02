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
  
  has_many :sticker_nodes , :dependent => :destroy
  
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
  def check_stickers    
    @nodes =[]
    # sticker_tags = self.content.scan(PATTERN_TAG)
    # sticker_tags.each do |sticker|
      self.content.gsub!(PATTERN_TAG) do |sticker|
         generate_identify_tag(sticker)
      end
    # TODO  add block check & modify
  end                
  
  def nodes
    @nodes || self.sticker_nodes
  end 
  
  private
  
  def create_nodes nodes=[] ,delete_not_for_use = true
    #  delete nodes that not for used by modify name
    old_nodes =  self.sticker_nodes
    new_nodes = []
    old_nodes.each do |node|
       n = old_nodes.find_by_name node 
       new_nodes.push(n ? n : self.sticker_nodes.create(:name => node))
    end    
    #delete old nodes that not for used any more      
    if delete_not_for_use
      (old_nodes - new_nodes).each do |node|
        #TODO : CLEAN relations
        node.destroy
      end
    end                                                      
    
  end                    
  #str to be checked
  def generate_identify_tag str  
     par = str.sub(/.*?sticker_tag\s*/,'').sub(/\s*%>/,'').chomp
     if par.blank?                      # no args
         "<%= sticker_tag :#{generate_id} %>"
       elsif par[0,1]==':' and par[1..-1].index(/\W+/).nil?       # no invalid , * in args . just one arg
         @nodes.push par[1..-1]
         str                            #do nothing
       else                             # raise errors
         raise TypeError,"#{str} 语法错误,请保持<%= sticker_tag %> 或仅添加 <%= sticker_tag :name %>  类似语法"
     end
  end 
  
  def generate_id
    id = "ID_#{(rand*1_000_000).to_i}_" 
     while @sticker_nodes.include? id
       id = "ID_#{(rand*1_000_000).to_i}_" 
     end 
     @nodes.push id   
     return id   
     
  end
  
end
