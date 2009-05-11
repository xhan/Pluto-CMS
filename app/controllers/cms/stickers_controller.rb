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
        @sticker.con_stickers.create(:sticker_node  => @sticker_node ,
        :page          => @page
        )
      end
      flash[:notice] = "new sticker has been saved"
      session[:page] = session[:node] = nil
      redirect_to @page.path
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
      session[:page] = session[:node] = nil

      redirect_to @page.path                         
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

    session[:page] = params[:page_id] if params[:page_id]
    session[:node] = params[:sticker_node_id] if params[:sticker_node_id]
    @page = Page.find_if session[:page]
    @sticker_node = StickerNode.find_if session[:node]
  end
end
