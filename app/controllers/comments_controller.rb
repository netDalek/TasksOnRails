class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:id])
    @comment = @story.comments.new(params[:comment])
    @comment.user_id = session[:user_id]
    if @comment.save
      redirect_to @story, notice: 'Comment was successfully created.'
    else
      render action: "stories/show", :template => "stories/show"
    end
  end
end
