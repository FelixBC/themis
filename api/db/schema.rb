# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_05_20_202524) do
  create_table "basket_ball_stats", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "team_id", null: false
    t.integer "points_scored"
    t.integer "points_allowed"
    t.string "win_loss_record"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_basket_ball_stats_on_game_id"
    t.index ["team_id"], name: "index_basket_ball_stats_on_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "league_id", null: false
    t.date "game_date"
    t.time "game_time"
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["league_id"], name: "index_games_on_league_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "zone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_groups_on_zone_id"
  end

  create_table "pitching_stats", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "team_id", null: false
    t.integer "pitcher_id", null: false
    t.boolean "is_starter"
    t.string "decision"
    t.string "gp_record"
    t.decimal "era"
    t.integer "hits_allowed"
    t.integer "runs_allowed"
    t.integer "walks"
    t.integer "strikeouts"
    t.string "last_gp_record"
    t.decimal "last_era"
    t.string "route"
    t.string "opponent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_pitching_stats_on_game_id"
    t.index ["pitcher_id"], name: "index_pitching_stats_on_pitcher_id"
    t.index ["team_id"], name: "index_pitching_stats_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "number"
    t.string "position"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role_id", null: false
    t.integer "zone_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["zone_id"], name: "index_users_on_zone_id"
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "basket_ball_stats", "games"
  add_foreign_key "basket_ball_stats", "teams"
  add_foreign_key "games", "away_teams"
  add_foreign_key "games", "home_teams"
  add_foreign_key "games", "leagues"
  add_foreign_key "groups", "zones"
  add_foreign_key "pitching_stats", "games"
  add_foreign_key "pitching_stats", "pitchers"
  add_foreign_key "pitching_stats", "teams"
  add_foreign_key "players", "teams"
  add_foreign_key "teams", "leagues"
  add_foreign_key "users", "groups"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "zones"
end
