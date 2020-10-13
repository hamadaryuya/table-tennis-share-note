class CalendarsController < ApplicationController
  def index
  end

  # 予定の保存
  def create
    Calendar.create(calendar_params)
    redirect_to action: :index
  end

  def new
    @calendar = Calendar.new
  end

  private

  def calendar_params
    params.require(:training).permit(:date, :training_menu, :purpose, :introspection)
  end
end
