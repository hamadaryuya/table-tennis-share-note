class CalendarsController < ApplicationController

  def index
    @trainings = Training.all
    @games = Game.all
  end
end
  