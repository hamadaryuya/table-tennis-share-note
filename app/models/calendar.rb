class Calendar < ApplicationRecord
  belongs_to :user
  has_many :trainings
  has_many :games

  def start_time
    date_and_time
  end

  def end_time
    meetingfinishtime
  end
end
