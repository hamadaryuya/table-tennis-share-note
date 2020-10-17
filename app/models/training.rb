class Training < ApplicationRecord
  belongs_to :calendar
  belongs_to :user

  validates :training_menu, presence: true
  validates :date, presence: true
  validates :purpose, presence: true
  validates :start_time, presence: true

end
