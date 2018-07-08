class Game < ActiveRecord::Base
  belongs_to :user, :class_name => 'User', :foreign_key => 'user_id'
  belongs_to :user, :class_name => 'User', :foreign_key => 'opponent_id'

  def opponent
    return User.find(self.opponent_id)
  end

  def score
    return "#{self.user_score} - #{self.opponent_score}"
  end

  def result
    return self.user_score > self.opponent_score ? "W" : "F"
  end
end
