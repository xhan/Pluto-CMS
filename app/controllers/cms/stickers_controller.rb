class Cms::StickersController < Cms::ApplicationController
  before_filter :setup
  def index
    @text_stickers = TextSticker.all 
    @widget_stickers = WidgetSticker.all
  end

  def new  
    
  end                                                               

  def show
    redirect_to [:cms,@sticker] if @sticker.is_a? WidgetSticker
  end     

  def create
    # just create text-sticker here 
    # widget sticker will be create at apps
    @sticker = TextSticker.new params[:sticker]
    @sticker.user = current_user
    if @sticker.save
      # connect page sticker node
      if @page && @sticker_node
        @sticker.con_stickers.create(:sticker_node  => @sticker_node ,
        :page          => @page
        )
      end
      flash[:notice] = "new sticker has been saved"
      session[:page] = session[:node] = nil
      if @page
        redirect_to @page.path  
      else
        redirect_to :action => "index"  
      end
      # go_back
    else
      flash[:notice] = "but it doesnt works,try again"
      render :action => "new"
    end
  end

  def select
    if @page && @sticker_node
      @sticker.con_stickers.create( :sticker_node  => @sticker_node ,
      :page  => @page
      )
      session[:page] = nil
       session[:node] = nil

      redirect_to @page.path                         
    end
  end       

  def edit
     
  end

  def update
    redirect_to cms_sticker_path(@sticker)   and return if @sticker.update_attributes params[:text_sticker]
    render :action => "edit" 
    
  end

  def destroy  
   if @sticker.page_count == 0 and  @sticker.destroy 
     flash[:notice] = "o,the sticker has been removed"
   else
     flash[:notice] = "belive me the sticker remains yet"
   end
     redirect_to cms_stickers_path
    
  end

  private  
  
  def related
    session[:page] = params[:page_id] if params[:page_id]
    session[:node] = params[:sticker_node_id] if params[:sticker_node_id]
    unless session[:page].blank? && session[:node].blank?
      @page = Page.find session[:page] 
      @sticker_node = StickerNode.find session[:node]  
    end
  end
  
  def setup
    @sticker = Sticker.find_if params[:id] 
    @sticker = Sticker.new unless params[:id]

    related
  end
end
