class Calendar < ApplicationRecord
  validates :training_menu, presence: true
  validates :date, presence: true
  validates :purpose, presence: true
end
