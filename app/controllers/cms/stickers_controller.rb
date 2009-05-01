class Cms::StickersController < Cms::ApplicationController
  before_filter :setup
  def index
    @stickers = Sticker.all
  end

  def new
  end

  def create
    @sticker = Sticker.new params[:sticker]
    if @sticker.save
      flash[:notice] = "new sticker has been saved"
      redirect_to :index
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
    @sticker = Sticker.find params[:id]
  end
end
