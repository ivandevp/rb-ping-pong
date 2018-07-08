class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :opponent_id
      t.integer :user_score, default: 0
      t.integer :opponent_score, default: 0
      t.date :played_at

      t.timestamps null: false
    end
  end
end
