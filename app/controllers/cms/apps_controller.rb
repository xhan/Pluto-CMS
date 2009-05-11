class Cms::AppsController < Cms::ApplicationController
  # GET /apps
  # GET /apps.xml
  check_permissions :edit ,:only => [:edit]
  check_permissions :publish ,:only => [:publish]
  
  def index
    @apps = App.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @apps }
    end
  end

  # GET /apps/1
  # GET /apps/1.xml
  def show
    @app = App.find(params[:id],:include => :trs)
    @trs = @app.trs
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @app }
    end
  end

  # GET /apps/new
  # GET /apps/new.xml
  def new
    @app = App.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @app }
    end
  end

  # GET /apps/1/edit
  def edit
    @app = App.find(params[:id])
  end

  # POST /apps
  # POST /apps.xml
  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        flash[:notice] = 'App was successfully created.'
        format.html { redirect_to([:cms,@app]) }
        format.xml  { render :xml => @app, :status => :created, :location => @apps }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @app.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /apps/1
  # PUT /apps/1.xml
  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        flash[:notice] = 'Apps was successfully updated.'
        format.html { redirect_to([:cms,@app]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @app.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /apps/1
  # DELETE /apps/1.xml
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to(cms_apps_url) }
      format.xml  { head :ok }
    end
  end       
  
  def publish
    @app = App.find params[:id]
    @app.publish!
    respond_to do |wants|  
      flash[:notice] = "Publish Success!"
      wants.html { redirect_to cms_app_path(@app) }
      wants.js do
        render :update do |page|
          page.alert "Update Success!"
        end
      end
    end
  end
end
