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

  def update
    @game = Game.find(params[:id])
    Game.update(game_params)
  end

  def destroy
    game = Game.find(params[:id])
     if game.user_id == current_user.id
      game.destroy
      redirect_to "/"
     end
  end

  def game_params
    params.require(:game).permit!
  end
end
