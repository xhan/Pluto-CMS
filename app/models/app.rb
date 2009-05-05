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
  has_many :trs, :class_name => "AppAttribute", :foreign_key => "app_id" , :dependent => :destroy
    
  BASE_TYPE = %w[integer string datetime text]
  # used in select options
  def self.type_select
    BASE_TYPE.map{ |v| [v,v] }
  end
end
