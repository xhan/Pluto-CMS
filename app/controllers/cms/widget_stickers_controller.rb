class Cms::WidgetStickersController < Cms::StickersController                                

  def index
    redirect_to cms_stickers_path
  end      


  def new  

  end

  def show

  end     

  def create
    # just create text-sticker here 
    # widget sticker will be create at apps
    @sticker = WidgetSticker.new params[:widget_sticker]
    @sticker.user = current_user
    if @sticker.save
      # connect page sticker node
      if @page && @sticker_node
        @sticker.con_stickers.create(:sticker_node  => @sticker_node ,
        :page          => @page
        )
      end
      flash[:notice] = "new sticker has been saved"
      #  it will set session value to "" but not nil.
      #  using blank? to check value exist
      session[:page] = session[:node] = nil
      if @page
        redirect_to @page.path  
      else
        redirect_to cms_stickers_path  
      end
    else
      flash[:notice] = "but it doesnt works,try again"
      render :action => "new"
    end
  end



  def edit

  end

  def update
    redirect_to cms_sticker_path(@sticker)   and return if @sticker.update_attributes params[:widget_sticker]
    render :action => "edit" 

  end

  # def destroy
  # end     

  private  


  def setup 
    @sticker = WidgetSticker.find_if params[:id]
    @sticker = WidgetSticker.new unless params[:id] 
    related
  end
end
