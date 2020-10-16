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

  private

  def calendar_params
    params.permit(:date, :training_menu, :purpose, :introspection, :start_date).merge(user_id: current_user.id)
  end
end
