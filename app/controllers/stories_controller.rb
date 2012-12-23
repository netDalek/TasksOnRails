class StoriesController < ApplicationController
  has_scope :by_user_id, as: "user_id"
  has_scope :by_state, as: "state"
  has_scope :not_assigned

  def index
    #params[:user_id] = nil if params[:user_id].to_i < 0
    if params[:commit] == "Filter"
      @stories = apply_scopes(Story).includes(:user).order "created_at desc"
    else
      @stories = Story.includes(:user).all
      params.clear
    end
    @users = User.all
  end

  def show
    @story = Story.includes(:user).find(params[:id])
    @comment = Comment.new
  end

  def new
    @story = Story.new
  end

  def edit
    @story = Story.find(params[:id])
  end

  def create
    @story = Story.new(params[:story])

    if @story.save
      redirect_to stories_path, notice: 'Story was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(params[:story])
      redirect_to @story, notice: 'Story was successfully updated.'
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_url
  end

  def change_state
    @story = Story.find(params[:id])
    if (@story.send("can_#{params[:event]}?"))
      @story.send(params[:event])
      @story.user_id = session[:user_id]
      @story.save
    end
    render layout: false
  end
end