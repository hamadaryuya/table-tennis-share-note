class CommentsController < ApplicationController
  def create
    coment = Comment.create(comment_params)
    redirect_to "/"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, training_id: params[:training_id])
  end

end
