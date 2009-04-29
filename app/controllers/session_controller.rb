class SessionController < ApplicationController
  
  skip_after_filter :store_location
  layout :set_layout

  def new   
    @user = User.new  
  end

  def edit  
    @user = current_user
  end
  


  def login
    go_back  and return if logged_in?
    # redirect_to :back and return if logged_in?
    @user = User.new
    return unless request.post?
    #handle authenticate
    if params[:user][:login] && params[:user][:login].size >0
      u = User.find_by_login params[:user][:login]
      if params[:user][:password] && params[:user][:password].size >0 && u
        if u.authenticated?(params[:user][:password]) 
          set_login_user u
          flash[:notice] = "Hello #{u.login}"
           go_back and return
        end
      end
    end
    
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

