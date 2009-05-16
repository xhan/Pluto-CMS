# Controls Sticker related whith page & nodes in con_stickers table
class Cms::StickerManageController < Cms::ApplicationController       
        
  # before_filter :protect_from_http                                                            
  before_filter :setup
  
  
  def up             
    if @point.move_pre
      render :text => "Success move pre"      
    end
  end   
  
  def down
    if @point.move_next
      render :text => "Success move next"
    end
  end     
    
  # remove relation ship
  def destroy
    @point.destroy
    render :text => "Success destroy"
  end            
  
  
  private
  
  def setup
    # 
    # @sticker = Sticker.find params[:id]
    # @page = Page.find params[:page_id]
    # @sticker_node = StickerNode.find params[:sticker_node_id]
=begin
  TODO in conditions  key => value  , key cannot be its reference , but the value can be a model ,and it will convert to model.id
  is there a better way to acts as ::conditions => {:sticker_node=> @sticker_node}  .
  2 .   :include :user  => :sth  what is exact means?
=end    
    # @point = ConSticker.find(:first,:conditions => {:sticker_node_id => @sticker_node, :page_id => @page,:refer => @sticker })
    @point = ConSticker.find params[:id]
  end 
  
  def protect_from_http
    access_denied unless request.xhr?
  end
  
end
