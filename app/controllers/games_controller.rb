class GamesController < ApplicationController
  def new
  end

  def create
    Game.create(game_params)
    redirect_to "/"
  end

  def game_params
    params.permit(:date, :start_date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end
end
