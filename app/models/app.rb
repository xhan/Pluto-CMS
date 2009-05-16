# == Schema Information
# Schema version: 20090505082027
#
# Table name: apps
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  class_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#  edit_block :text
#  show_block :text
#  list_block :text
#  type       :integer(4)
#

class App < ActiveRecord::Base
  # acts_as_commentable
  # has_many :app_attributes       
  has_many :widget_stickers , :dependent => :destroy
  has_many :trs, :class_name => "AppAttribute", :foreign_key => "app_id" , :dependent => :destroy
  # has_many :app_attributes , :conditions => "value",   
  BASE_TYPE = %w[integer string datetime text]
  # used in select options
  def self.type_select
    BASE_TYPE.map{ |v| [v,v] }
  end                                       

  # include Plutocms::FileRecord
  include Plutocms::ErbBuilder                 
  APP_FOLDER = "cms_apps"
  APPLAYOUT_PATH = "#{RAILS_ROOT}/app/views/#{APP_FOLDER}"



  def publish!
    Dir.mkdir APPLAYOUT_PATH unless File.exist? APPLAYOUT_PATH
    Dir.mkdir main_path unless File.exist? main_path
    write_file 'show' , show_block
    write_file 'list' , list_block
    write_file 'edit' , edit_block
    write_class                    
    write_controller           
    write_sticker 'show' 
    write_sticker 'list'
    update_attribute :published_at , Time.now
  end

  def render_path partial_name
    "#{APP_FOLDER}/#{class_name.underscore}/#{partial_name}"
  end

  def write_sticker action_name                            
      ws = widget_stickers.with_action(action_name)
    if ws.blank?
       widget_stickers.create(:action => action_name , :content => render_content(action_name),:name => "#{name}-#{action_name}"  )
     else    
       ws[0].update_attributes(:content => render_content(action_name), :name => "#{name}-#{action_name}" )
    end
  end 

  # private 

 def render_content action_name
   case action_name
   when "show"                                                                                                
      <<-EOS
       if  render_value = Apps::#{class_name}.find_if(@app_id)
        render :partial => "#{render_path(action_name)}" , :object => render_value 
       else                                                                        
         "暂时没有信息哟！"
       end
      EOS
    when "list"
      <<-EOS
      render_value = Apps::#{class_name}.all
       if !render_value.blank? 
        render :partial => "#{render_path(action_name)}" , :collection => render_value 
       else                                                                        
         "暂时没有信息哟！"
       end
      EOS
   end
 end


  def write_class
    open "#{RAILS_ROOT}/app/models/apps/#{class_name.underscore}.rb","w" do |file|
      file.puts generate_erb(open_erb)
    end 
  end            
  
  # value used in erb render
  def attr_hash
     hash={}
    self.trs.each do |attr|
      hash[attr.name] = attr.link_name
    end 
    hash
  end            
  
  
  def link_name_syms
    res = ""
    attr_hash.each_value do |v|
      res += ",:#{v}"
    end        
    res
  end
  
  # L end of values used in erb
  
  def write_controller
    open "#{RAILS_ROOT}/app/controllers/apps/#{class_name.underscore.pluralize}_controller.rb","w" do |file|
      file.puts generate_erb(open_erb("apps_controller"))
    end    
  end                 
  
  def main_path
    APPLAYOUT_PATH + "/#{self.class_name.underscore}"
  end

  def write_file name,content
    open "#{main_path}/_#{name}.html.erb","w" do |file|
      file.puts content
    end 
  end                  

end
