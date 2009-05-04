class CreateAppBases < ActiveRecord::Migration
  def self.up
    create_table :app_bases do |t|
      30.times do |cnt|
        t.string "string_#{cnt}".to_sym
        t.text "text_#{cnt}".to_sym
        t.integer "integer_#{cnt}".to_sym
        t.integer "foreign_#{cnt}".to_sym
        t.datetime "datetime_#{cnt}".to_sym
      end
      t.timestamps
    end
  end

  def self.down
    drop_table :app_bases
  end
end
