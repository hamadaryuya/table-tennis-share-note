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
    params.require(:training).permit(:date, :training_menu, :purpose)
  end

  def getweek
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    calendars = Calendar.where(date: @todays_date..@todays_date + 6)

    7.times do |x|
      today_calendars = []
      calendar = calendars.map do |calendar|
        today_calendars.push(calendar.calendar) if calendar.date == @todays_date + x
      end


      wday_num = (@todays_date.wday + x)

      if wday_num >= 7
        wday_num = wday_num - 7
      end
      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, wday: wdays[wday_num], plans: today_calendars}

      
      @week_days.push(days)
    end
  end
end
