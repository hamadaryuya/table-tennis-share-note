class CalendarsController < ApplicationController
  before_action :move_to_index

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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
