class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  scope :opponents, ->(user) { where.not(id: user) }
  scope :games_played, ->(user) { Game.where(user_id: user).count }

  scope :ranking, lambda { User.all.sort_by(&:score).reverse }

  def score
    won_games = Game.where("user_score > opponent_score AND user_id = :id", { id: self.id })
    lost_games = Game.where("user_score < opponent_score AND user_id = :id", { id: self.id })

    return (won_games.count * 100) - (lost_games.count * -50)
  end

end
