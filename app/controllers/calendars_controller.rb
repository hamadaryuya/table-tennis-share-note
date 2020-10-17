class CalendarsController < ApplicationController
  def index
    @calendars = Calendar.all
    @calendar = Calendar.create(calendar_params)
  end

  def create
    Calendar.create(calendar_params)
    redirect_to action: :index
  end

  def new
    @calendar = Calendar.new
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def show
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])
    Calendar.update(calendar_params)
  end

  def destroy
    calendar = Calendar.find(params[:id])
     if calendar.user_id == current_user.id
      calendar.destroy
      redirect_to action: :index
     end
  end

  private

  def calendar_params
    params.permit(:date, :training_menu, :purpose, :introspection, :start_date, :opponent, :result, :good_point, :game_introspection).merge(user_id: current_user.id)
  end
end
