class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to bike_path(@comment.bike)
    else
      @bike = @comment.bike
      @comments = @bike.comments
      render "bikes/show"
  end
end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, bike_id: params[:bike_id])
  end
end
