class GamesController < ApplicationController
  before_action :game_comment_set, only: [:edit, :show]

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.save
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @game = Game.find(params[:id])
    if  @game.update(update_game_params)
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    game = Game.find(params[:id])
    if game.user_id == current_user.id
      game.destroy
      redirect_to '/'
    end
  end

  private

  def game_params
    params.require(:game).permit(:date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
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
