class Game < ApplicationRecord
  belongs_to :user
  belongs_to :calendar, optional: true
  has_many :game_comments 

  validates :opponent, presence: true
  validates :date, presence: true
end
