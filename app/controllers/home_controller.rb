class HomeController < ApplicationController
  def index
    @users = User.ranking
  end

  def history
    @games = Game.where(user_id: current_user.id)
  end
end
