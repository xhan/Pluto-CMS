class FileclipsController < ApplicationController
  # GET /fileclips
  # GET /fileclips.xml
  def index
    @fileclips = Fileclip.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fileclips }
    end
  end

  # GET /fileclips/1
  # GET /fileclips/1.xml
  def show
    @fileclip = Fileclip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fileclip }
    end
  end

  # GET /fileclips/new
  # GET /fileclips/new.xml
  def new
    @fileclip = Fileclip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fileclip }
    end
  end

  # GET /fileclips/1/edit
  def edit
    @fileclip = Fileclip.find(params[:id])
  end

  # POST /fileclips
  # POST /fileclips.xml
  def create
    @fileclip = Fileclip.new(params[:fileclip])

    respond_to do |format|
      if @fileclip.save
        flash[:notice] = 'Fileclip was successfully created.'
        format.html { redirect_to(@fileclip) }
        format.xml  { render :xml => @fileclip, :status => :created, :location => @fileclip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fileclip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fileclips/1
  # PUT /fileclips/1.xml
  def update
    @fileclip = Fileclip.find(params[:id])

    respond_to do |format|
      if @fileclip.update_attributes(params[:fileclip])
        flash[:notice] = 'Fileclip was successfully updated.'
        format.html { redirect_to(@fileclip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fileclip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fileclips/1
  # DELETE /fileclips/1.xml
  def destroy
    @fileclip = Fileclip.find(params[:id])
    @fileclip.destroy

    respond_to do |format|
      format.html { redirect_to(fileclips_url) }
      format.xml  { head :ok }
    end
  end
end
