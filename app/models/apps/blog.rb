# == Schema Information
# Schema version: 20090505082027
#
# Table name: app_bases
#
#  id          :integer(4)      not null, primary key
#  string_0    :string(255)
#  text_0      :text
#  integer_0   :integer(4)
#  foreign_0   :integer(4)
#  datetime_0  :datetime
#  string_1    :string(255)
#  text_1      :text
#  integer_1   :integer(4)
#  foreign_1   :integer(4)
#  datetime_1  :datetime
#  string_2    :string(255)
#  text_2      :text
#  integer_2   :integer(4)
#  foreign_2   :integer(4)
#  datetime_2  :datetime
#  string_3    :string(255)
#  text_3      :text
#  integer_3   :integer(4)
#  foreign_3   :integer(4)
#  datetime_3  :datetime
#  string_4    :string(255)
#  text_4      :text
#  integer_4   :integer(4)
#  foreign_4   :integer(4)
#  datetime_4  :datetime
#  string_5    :string(255)
#  text_5      :text
#  integer_5   :integer(4)
#  foreign_5   :integer(4)
#  datetime_5  :datetime
#  string_6    :string(255)
#  text_6      :text
#  integer_6   :integer(4)
#  foreign_6   :integer(4)
#  datetime_6  :datetime
#  string_7    :string(255)
#  text_7      :text
#  integer_7   :integer(4)
#  foreign_7   :integer(4)
#  datetime_7  :datetime
#  string_8    :string(255)
#  text_8      :text
#  integer_8   :integer(4)
#  foreign_8   :integer(4)
#  datetime_8  :datetime
#  string_9    :string(255)
#  text_9      :text
#  integer_9   :integer(4)
#  foreign_9   :integer(4)
#  datetime_9  :datetime
#  string_10   :string(255)
#  text_10     :text
#  integer_10  :integer(4)
#  foreign_10  :integer(4)
#  datetime_10 :datetime
#  string_11   :string(255)
#  text_11     :text
#  integer_11  :integer(4)
#  foreign_11  :integer(4)
#  datetime_11 :datetime
#  string_12   :string(255)
#  text_12     :text
#  integer_12  :integer(4)
#  foreign_12  :integer(4)
#  datetime_12 :datetime
#  string_13   :string(255)
#  text_13     :text
#  integer_13  :integer(4)
#  foreign_13  :integer(4)
#  datetime_13 :datetime
#  string_14   :string(255)
#  text_14     :text
#  integer_14  :integer(4)
#  foreign_14  :integer(4)
#  datetime_14 :datetime
#  string_15   :string(255)
#  text_15     :text
#  integer_15  :integer(4)
#  foreign_15  :integer(4)
#  datetime_15 :datetime
#  string_16   :string(255)
#  text_16     :text
#  integer_16  :integer(4)
#  foreign_16  :integer(4)
#  datetime_16 :datetime
#  string_17   :string(255)
#  text_17     :text
#  integer_17  :integer(4)
#  foreign_17  :integer(4)
#  datetime_17 :datetime
#  string_18   :string(255)
#  text_18     :text
#  integer_18  :integer(4)
#  foreign_18  :integer(4)
#  datetime_18 :datetime
#  string_19   :string(255)
#  text_19     :text
#  integer_19  :integer(4)
#  foreign_19  :integer(4)
#  datetime_19 :datetime
#  string_20   :string(255)
#  text_20     :text
#  integer_20  :integer(4)
#  foreign_20  :integer(4)
#  datetime_20 :datetime
#  string_21   :string(255)
#  text_21     :text
#  integer_21  :integer(4)
#  foreign_21  :integer(4)
#  datetime_21 :datetime
#  string_22   :string(255)
#  text_22     :text
#  integer_22  :integer(4)
#  foreign_22  :integer(4)
#  datetime_22 :datetime
#  string_23   :string(255)
#  text_23     :text
#  integer_23  :integer(4)
#  foreign_23  :integer(4)
#  datetime_23 :datetime
#  string_24   :string(255)
#  text_24     :text
#  integer_24  :integer(4)
#  foreign_24  :integer(4)
#  datetime_24 :datetime
#  string_25   :string(255)
#  text_25     :text
#  integer_25  :integer(4)
#  foreign_25  :integer(4)
#  datetime_25 :datetime
#  string_26   :string(255)
#  text_26     :text
#  integer_26  :integer(4)
#  foreign_26  :integer(4)
#  datetime_26 :datetime
#  string_27   :string(255)
#  text_27     :text
#  integer_27  :integer(4)
#  foreign_27  :integer(4)
#  datetime_27 :datetime
#  string_28   :string(255)
#  text_28     :text
#  integer_28  :integer(4)
#  foreign_28  :integer(4)
#  datetime_28 :datetime
#  string_29   :string(255)
#  text_29     :text
#  integer_29  :integer(4)
#  foreign_29  :integer(4)
#  datetime_29 :datetime
#  created_at  :datetime
#  updated_at  :datetime
#  type        :string(255)
#

class Apps::Blog < AppBase
  cms_attr_link :title , :string_1
  cms_attr_link :body ,  :string_2
  cms_attr_link :user_id , :froeign_1
end