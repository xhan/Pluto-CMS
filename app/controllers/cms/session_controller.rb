class Cms::SessionController < Cms::ApplicationController

  layout :set_layout

  def new   
    @user = User.new  
  end

  def edit  
    @user = current_user
  end



  def login
    redirect_back_or_default '/' and return if logged_in?
    @user = User.new
    return unless request.post?
    #handle authenticate
    if params[:user][:login] && params[:user][:login].size >0
      u = User.find_by_login params[:user][:login]
      if params[:user][:password] && params[:user][:password].size >0 && u
        if u.authenticated?(params[:user][:password]) 
          session[:id] =u.id
          flash[:notice] = "Hello #{u.login}"
          redirect_back_or_default '/'
        end
      end
    end
    # flash.now[:error] = "uh-oh, login didn't work.Do you have caps lock on? Try again!"
      flash[:notice] ="uh-oh, login didn't work.Do you have caps lock on? Try again!"
  end


  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Congratulations, your account has been Created!"
      redirect_back_or_default '/'
    else
      flash.now[:error] = @user.errors
      render :action => :new
    end
  end

  def logout
    logout!
  end

  private

  def set_layout
    if request.xhr?
      false
    else
      'application'
    end
  end

end

