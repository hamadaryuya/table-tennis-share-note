class GameCommentsController < ApplicationController
  def create
    game_coment = GameComment.create(game_comment_params)
    redirect_to "/"
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:text).merge(user_id: current_user.id, game_id: params[:game_id])
  end
end
