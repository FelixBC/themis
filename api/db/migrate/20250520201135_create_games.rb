class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :league, null: false, foreign_key: true
      t.date :game_date
      t.time :game_time
      t.references :home_team, null: false, foreign_key: true
      t.references :away_team, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
