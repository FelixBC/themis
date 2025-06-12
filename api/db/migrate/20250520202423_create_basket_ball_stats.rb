class CreateBasketBallStats < ActiveRecord::Migration[7.0]
  def change
    create_table :basket_ball_stats do |t|
      t.references :game, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.integer :points_scored
      t.integer :points_allowed
      t.string :win_loss_record

      t.timestamps
    end
  end
end
