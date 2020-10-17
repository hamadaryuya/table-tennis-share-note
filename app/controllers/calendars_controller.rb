class CalendarsController < ApplicationController

  def index
    @trainings = Training.all
    @games = Game.all
    @training = Training.find_by(user_id: params[:user_id])
    @game = Game.find_by(user_id: params[:user_id])
  end

  private

  def training_params
    params.permit(:date, :training_menu, :purpose, :introspection).merge(user_id: current_user.id)
  end
end
  