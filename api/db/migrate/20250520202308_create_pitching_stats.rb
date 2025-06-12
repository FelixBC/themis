class CreatePitchingStats < ActiveRecord::Migration[7.0]
  def change
    create_table :pitching_stats do |t|
      t.references :game, null: false, foreign_key: true
      t.references :team, null: false, foreign_key: true
      t.references :pitcher, null: false, foreign_key: true
      t.boolean :is_starter
      t.string :decision
      t.string :gp_record
      t.decimal :era
      t.integer :hits_allowed
      t.integer :runs_allowed
      t.integer :walks
      t.integer :strikeouts
      t.string :last_gp_record
      t.decimal :last_era
      t.string :route
      t.string :opponent

      t.timestamps
    end
  end
end
