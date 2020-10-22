class User < ApplicationRecord
  has_many :trainings
  has_one :calendar
  has_many :comments
  has_many :game_comments

  validates :name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
