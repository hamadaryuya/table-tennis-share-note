class Training < ApplicationRecord
  belongs_to :user

  validates :training_menu, presence: true
  validates :date, presence: true
  validates :purpose, presence: true

end
