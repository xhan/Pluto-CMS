# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090505065135) do

  create_table "app_bases", :force => true do |t|
    t.string   "string_0"
    t.text     "text_0"
    t.integer  "integer_0"
    t.integer  "foreign_0"
    t.datetime "datetime_0"
    t.string   "string_1"
    t.text     "text_1"
    t.integer  "integer_1"
    t.integer  "foreign_1"
    t.datetime "datetime_1"
    t.string   "string_2"
    t.text     "text_2"
    t.integer  "integer_2"
    t.integer  "foreign_2"
    t.datetime "datetime_2"
    t.string   "string_3"
    t.text     "text_3"
    t.integer  "integer_3"
    t.integer  "foreign_3"
    t.datetime "datetime_3"
    t.string   "string_4"
    t.text     "text_4"
    t.integer  "integer_4"
    t.integer  "foreign_4"
    t.datetime "datetime_4"
    t.string   "string_5"
    t.text     "text_5"
    t.integer  "integer_5"
    t.integer  "foreign_5"
    t.datetime "datetime_5"
    t.string   "string_6"
    t.text     "text_6"
    t.integer  "integer_6"
    t.integer  "foreign_6"
    t.datetime "datetime_6"
    t.string   "string_7"
    t.text     "text_7"
    t.integer  "integer_7"
    t.integer  "foreign_7"
    t.datetime "datetime_7"
    t.string   "string_8"
    t.text     "text_8"
    t.integer  "integer_8"
    t.integer  "foreign_8"
    t.datetime "datetime_8"
    t.string   "string_9"
    t.text     "text_9"
    t.integer  "integer_9"
    t.integer  "foreign_9"
    t.datetime "datetime_9"
    t.string   "string_10"
    t.text     "text_10"
    t.integer  "integer_10"
    t.integer  "foreign_10"
    t.datetime "datetime_10"
    t.string   "string_11"
    t.text     "text_11"
    t.integer  "integer_11"
    t.integer  "foreign_11"
    t.datetime "datetime_11"
    t.string   "string_12"
    t.text     "text_12"
    t.integer  "integer_12"
    t.integer  "foreign_12"
    t.datetime "datetime_12"
    t.string   "string_13"
    t.text     "text_13"
    t.integer  "integer_13"
    t.integer  "foreign_13"
    t.datetime "datetime_13"
    t.string   "string_14"
    t.text     "text_14"
    t.integer  "integer_14"
    t.integer  "foreign_14"
    t.datetime "datetime_14"
    t.string   "string_15"
    t.text     "text_15"
    t.integer  "integer_15"
    t.integer  "foreign_15"
    t.datetime "datetime_15"
    t.string   "string_16"
    t.text     "text_16"
    t.integer  "integer_16"
    t.integer  "foreign_16"
    t.datetime "datetime_16"
    t.string   "string_17"
    t.text     "text_17"
    t.integer  "integer_17"
    t.integer  "foreign_17"
    t.datetime "datetime_17"
    t.string   "string_18"
    t.text     "text_18"
    t.integer  "integer_18"
    t.integer  "foreign_18"
    t.datetime "datetime_18"
    t.string   "string_19"
    t.text     "text_19"
    t.integer  "integer_19"
    t.integer  "foreign_19"
    t.datetime "datetime_19"
    t.string   "string_20"
    t.text     "text_20"
    t.integer  "integer_20"
    t.integer  "foreign_20"
    t.datetime "datetime_20"
    t.string   "string_21"
    t.text     "text_21"
    t.integer  "integer_21"
    t.integer  "foreign_21"
    t.datetime "datetime_21"
    t.string   "string_22"
    t.text     "text_22"
    t.integer  "integer_22"
    t.integer  "foreign_22"
    t.datetime "datetime_22"
    t.string   "string_23"
    t.text     "text_23"
    t.integer  "integer_23"
    t.integer  "foreign_23"
    t.datetime "datetime_23"
    t.string   "string_24"
    t.text     "text_24"
    t.integer  "integer_24"
    t.integer  "foreign_24"
    t.datetime "datetime_24"
    t.string   "string_25"
    t.text     "text_25"
    t.integer  "integer_25"
    t.integer  "foreign_25"
    t.datetime "datetime_25"
    t.string   "string_26"
    t.text     "text_26"
    t.integer  "integer_26"
    t.integer  "foreign_26"
    t.datetime "datetime_26"
    t.string   "string_27"
    t.text     "text_27"
    t.integer  "integer_27"
    t.integer  "foreign_27"
    t.datetime "datetime_27"
    t.string   "string_28"
    t.text     "text_28"
    t.integer  "integer_28"
    t.integer  "foreign_28"
    t.datetime "datetime_28"
    t.string   "string_29"
    t.text     "text_29"
    t.integer  "integer_29"
    t.integer  "foreign_29"
    t.datetime "datetime_29"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "app_name"
  end

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "class_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "con_stickers", :force => true do |t|
    t.integer  "sticker_node_id"
    t.integer  "page_id"
    t.integer  "sticker_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fileclips", :force => true do |t|
    t.string   "f_file_name"
    t.string   "f_content_type"
    t.integer  "f_file_size"
    t.datetime "f_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_posts", :force => true do |t|
    t.integer  "forum_topic_id"
    t.text     "body"
    t.integer  "forum_user_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_topics", :force => true do |t|
    t.integer  "forum_id"
    t.integer  "forum_user_profile_id"
    t.string   "title"
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forum_user_profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "signarea"
    t.boolean  "is_active",  :default => false
    t.string   "website"
    t.string   "about_me"
    t.string   "time_zone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forums", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_id"
    t.integer  "version"
    t.string   "name"
    t.string   "title"
    t.string   "path"
    t.string   "template"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",       :default => false
    t.boolean  "deleted",         :default => false
    t.boolean  "archived",        :default => false
    t.string   "version_comment"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
  end

  create_table "pages", :force => true do |t|
    t.integer  "version"
    t.integer  "lock_version",  :default => 0
    t.string   "name"
    t.string   "title"
    t.string   "path"
    t.string   "templet_id"
    t.boolean  "hidden"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published",     :default => false
    t.boolean  "deleted",       :default => false
    t.boolean  "archived",      :default => false
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "section_id"
    t.integer  "position"
  end

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "parent_id"
    t.integer  "position"
    t.boolean  "hidden",     :default => false
    t.boolean  "is_url",     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sticker_nodes", :force => true do |t|
    t.integer  "templet_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sticker_nodes", ["name"], :name => "index_sticker_nodes_on_name"

  create_table "stickers", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "content"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "templets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "content"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "email",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "expires_at"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
