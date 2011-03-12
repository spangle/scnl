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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110311193939) do

  create_table "drivers", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_posts", :force => true do |t|
    t.integer  "poster_id"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_posts", ["poster_id"], :name => "index_message_posts_on_poster_id"

  create_table "race_relations", :force => true do |t|
    t.integer  "event_id"
    t.integer  "owner_id"
    t.integer  "pilot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "race_relations", ["event_id", "owner_id", "pilot_id"], :name => "index_race_relations_on_event_id_and_owner_id_and_pilot_id", :unique => true
  add_index "race_relations", ["event_id"], :name => "index_race_relations_on_event_id"
  add_index "race_relations", ["owner_id"], :name => "index_race_relations_on_owner_id"
  add_index "race_relations", ["pilot_id"], :name => "index_race_relations_on_pilot_id"

  create_table "race_results", :force => true do |t|
    t.integer  "match_id"
    t.integer  "finisher_id"
    t.integer  "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "points"
  end

  add_index "race_results", ["finisher_id"], :name => "index_race_results_on_finisher_id"
  add_index "race_results", ["match_id", "finisher_id", "place"], :name => "index_race_results_on_match_id_and_finisher_id_and_place", :unique => true
  add_index "race_results", ["match_id"], :name => "index_race_results_on_match_id"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "selector_id"
    t.date     "racedate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "track"
  end

  add_index "races", ["racedate"], :name => "index_races_on_racedate"
  add_index "races", ["selector_id"], :name => "index_races_on_selector_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
