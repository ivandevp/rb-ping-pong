class HomeController < ApplicationController
  def index
    @users = User.ranking
  end
end
