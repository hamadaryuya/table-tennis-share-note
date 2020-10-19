class Game < ApplicationRecord
  belongs_to :user
  has_many :game_comments
  
  validates :opponent, presence: true
  validates :date, presence: true 
end
