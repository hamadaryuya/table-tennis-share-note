class GamesController < ApplicationController
  def new
  end

  def create
    Game.create(game_params)
    redirect_to "/"
  end

  def edit
    @game = Game.find(params[:id])
  end

  def show
    @game = Game.find_by(user_id: params[:user_id])
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

  def game_params
    params.permit(:date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end

  def update_game_params
    params.require(:game).permit(:date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end
end
