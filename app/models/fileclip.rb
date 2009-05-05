# == Schema Information
# Schema version: 20090505082027
#
# Table name: fileclips
#
#  id             :integer(4)      not null, primary key
#  f_file_name    :string(255)
#  f_content_type :string(255)
#  f_file_size    :integer(4)
#  f_updated_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#

class Fileclip < ActiveRecord::Base
  has_attached_file :f , :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
