class Calendar < ApplicationRecord
  belongs_to :user
  
  def start_time
    self.date_and_time
  end

  def end_time
    self.meetingfinishtime
  end
end
