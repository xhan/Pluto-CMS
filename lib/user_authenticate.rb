# Methods to Authenticate user login
module UserAuthenticate
  # private
  #return true if the user is authenticate to the system

  def logout!
    reset_session
    @current_user = nil
    flash[:notice] = "You have been logged out!"
    redirect_to('/')
  end
  
  def current_user
    @current_user ||= User.find session[:id] if session[:id]
  end
  
  def logged_in?
    !!current_user()
  end
  
  def logout!
    session[:id] = nil
    reset_session
  end
  
  def current_user= user
    @current_user = user
    session[:id] = user.id
  end
  
  def login_required
    name,passwd = get_auth_data
    @current_user ||= User.authenticate(name,passwd) if name && passwd
    access_denied unless (logged_in?)
  end
  
  
  def access_denied
    store_location
    redirect_to(login_path)
  end
  
  def store_location
    return true if request.xhr?
    session[:return_to] = "#{request.request_uri}"
  end
  
  # Redirect to the URI stored by the most recent store_location call or
  # to the passed default.
  def redirect_back url=nil
       if url
          redirect_to url
        else
          redirect_to session[:return_to]
       end 
  end
  
  def redirect_back_or_default(default)
    # return if performed?
    if session[:return_to] && 
      session[:return_to] != "#{request.request_uri}" &&
      !session[:return_to].include?( request.path)
      redirect_to(session[:return_to]) 
    else 
      redirect_to(default)
    end
    session[:return_to] = nil
  end


  #  When called with before_filter :login_from_cookie will check for an :auth_token
  #  cookie and log the user back in if apropriate
    def login_from_cookie
      return true unless cookies[:auth_token] && !logged_in?
      return true if @u
      user = User.find_by_remember_token(cookies[:auth_token])
      if user && user.remember_token?
        user.remember_me
        self.user = user
        cookies[:auth_token] = { :value => self.user.remember_token , :expires => self.user.remember_token_expires_at  }
        flash[:notice] = "Logged in successfully"
      end
      true
    end


    # gets BASIC auth info
    def get_auth_data
      user, pass = nil, nil
      # extract authorisation credentials 
      if request.env.has_key? 'X-HTTP_AUTHORIZATION' 
        # try to get it where mod_rewrite might have put it 
        authdata = request.env['X-HTTP_AUTHORIZATION'].to_s.split 
      elsif request.env.has_key? 'HTTP_AUTHORIZATION' 
        # this is the regular location 
        authdata = request.env['HTTP_AUTHORIZATION'].to_s.split  
      end 

      # at the moment we only support basic authentication 
      if authdata && authdata[0] == 'Basic' 
        user, pass = Base64.decode64(authdata[1]).split(':')[0..1] 
      end 
      return [user, pass] 
    end
  #
  
  def self.included base
    base.send :helper_method ,:current_user,:logged_in?
  end
end