class Game < ApplicationRecord
  belongs_to :user

  validates :opponent, presence: true
  validates :date, presence: true 
end
