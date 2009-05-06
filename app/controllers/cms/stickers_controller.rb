class Cms::StickersController < Cms::ApplicationController
  before_filter :setup
  def index
    @stickers = Sticker.all 
  end

  def new
  end
  
  def show
    
  end     
  
  def create

    @sticker = Sticker.new params[:sticker]
    if @sticker.save
      # connect page sticker node
      if @page && @sticker_node
          ConSticker.create(:sticker_node  => @sticker_node ,
                            :page          => @page,
                            :sticker       => @sticker
                            )
      end
      flash[:notice] = "new sticker has been saved"
      redirect_to cms_stickers_path
    else
      flash[:notice] = "but it doesnt works,try again"
      render :action => "new"
    end
  end

  def edit
    
  end

  def update
    redirect_to [:cms,@sticker] and return if @sticker.update_attributes params[:sticker]
    render :action => "edit"
  end

  def destroy
  end

private
  def setup
    @sticker = Sticker.find_if params[:id] 
    @sticker = Sticker.new unless params[:id]
    @page = Page.find_if params[:page_id]
    @sticker_node = StickerNode.find_if params[:sticker_node_id]
  end
end
