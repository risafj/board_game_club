# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_14_113556) do

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_games_on_name", unique: true
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.integer "favorite_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "available_days_id"
    t.index ["available_days_id"], name: "index_members_on_available_days_id"
    t.index ["favorite_game_id"], name: "index_members_on_favorite_game_id"
    t.index ["name"], name: "index_members_on_name", unique: true
  end

  create_table "weekdays", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_weekdays_on_name", unique: true
  end

end
