class GamesController < ApplicationController
  before_action :game_comment_set, only: [:edit, :show]

  def create
    Game.create(game_params)
    redirect_to "/"
  end

  def update
    @game = Game.find(params[:id])
    Game.update(update_game_params)
  end

  def destroy
    game = Game.find(params[:id])
     if game.user_id == current_user.id
      game.destroy
      redirect_to "/"
     end
  end

  private

  def game_params
    params.permit(:date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end

  def update_game_params
    params.require(:game).permit(:date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end

  def game_comment_set
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
    @game_comments = @game.game_comments.includes(:user)
  end
end
