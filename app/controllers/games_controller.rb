class GamesController < ApplicationController
    def index
        @games = Game.where(user_id: current_user.id)
    end
    
    def new
        @game = Game.new
        @opponents = User.opponents(current_user)
    end

    def create
        @game = Game.new(game_params)
        @game.user_id = current_user.id

        if @game.save
            redirect_to root_path
        else
            render :new
        end
    end

    private
        def game_params
            params.require(:game).permit(:played_at, :user_id, :opponent_id, :user_score, :opponent_score)
        end
end
