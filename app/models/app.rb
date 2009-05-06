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
  has_many :widget_stickers
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
    update_attribute :published_at , Time.now
  end
  
  def render_path partial_name
    "#{APP_FOLDER}/#{class_name.underscore}/#{partial_name}"
  end
  
  private 
  
  def write_class
    open "#{RAILS_ROOT}/app/models/apps/#{class_name.underscore}.rb","w" do |file|
      file.puts generate_erb(open_erb)
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
