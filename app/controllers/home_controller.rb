class HomeController < ApplicationController
  def index
  end

  def history
    @games = Game.where(user_id: current_user.id)
    p @games
  end
end
