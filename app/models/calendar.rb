class Calendar < ApplicationRecord
  belongs_to :user

  def start_time
    date_and_time
  end

  def end_time
    meetingfinishtime
  end
end
