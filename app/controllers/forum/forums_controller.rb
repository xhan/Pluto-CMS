class Forum::ForumsController < ApplicationController
  skip_before_filter :login_required , :only => [:index , :show]
  layout :set_layout
  def index
    find_object
  end

  def new 
    @forum = Forum.new
  end

  def edit
     find_object
  end
  
  def show
    find_object
  end

  def update_positions
    params[:forums_list].each_with_index do |id, index|
      Forum.update(id,:position => index)
    end unless params[:forums_list].blank?
    render :nothing => true
  end
  
  def create
    @forum = Forum.new params[:forum]
    respond_to do |wants|
      wants.html { }
      wants.js do
        render :update do |page|
          if @forum.save
            # page.alert "saved!"
            page << "tb_remove()"
            page.insert_html :bottom, :forums_list, :partial => 'each_forum', :object => @forum
            page.visual_effect :highlight ,@forum.dom_id
          else
            # page.alert "errors"
            page.replace_html "new_forum_form", :partial=>"new",:object=>@forum
            #page.alert @forum.errors.to_s
          end
        end
      end
    end
  end                       

  private

  def find_object
    if params[:id]
      @forum = Forum.find params[:id] , :include => :topics , :order => "forum_topics.created_at esc"
      @topics = @forum.topics.paginate(:all, :page => params[:page], :per_page => @per_page)
      
    else
      @forums = Forum.all(:order => "position")
    end
  end


end
