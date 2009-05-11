class Cms::UsersController < Cms::ApplicationController
  before_filter :setup

  def index
    @users = User.all
  end      
  
  def show
    
  end
 
  def edit 
    if @user == current_user
      flash[:notice] = " U cannot modify uself groups & permissions"
      redirect_to :action => "show"
      return
    end
    @permissions = Permission.all
    @groups  = Group.all
  end
          
  def destroy
    
  end         
         
  def update                        
    if @user == current_user
      flash[:notice] = " U cannot modify uself groups & permissions"
      redirect_to :action => "show"
      return
    end
    @user.update_attributes params[:user]
    redirect_to :action => "show"
  end         

  private    
  
  def setup
    @user =  params[:id] ? User.find(params[:id])  : User.new
  end
end