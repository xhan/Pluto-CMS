class Cms::TextStickersController < ApplicationController      
  active_scaffold :text_sticker do |config|
    config.columns = [:name,:content]
  end
end
