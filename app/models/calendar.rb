class Calendar < ApplicationRecord
  has_many :trainings

  validates :training_menu, presence: true
  validates :date, presence: true
  validates :purpose, presence: true

  def start_time
    self.date_and_time
  end

  def end_time
    self.meetingfinishtime
  end
end
