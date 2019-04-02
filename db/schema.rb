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

ActiveRecord::Schema.define(version: 2019_04_01_071349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversion_words", force: :cascade do |t|
    t.string "name"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_conversion_words_on_tag_id"
  end

  create_table "event_tags", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "price"
    t.string "name"
    t.string "category"
    t.date "date"
    t.string "beginning_hour"
    t.string "end_hour"
    t.text "description"
    t.bigint "venue_id"
    t.string "url"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
<<<<<<< HEAD
    t.string "cinema_genre"
=======
    t.string "genre"
>>>>>>> e6962ec634cc463c2fec708f733ae2880b67ff2b
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "saved_events", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_saved_events_on_event_id"
    t.index ["user_id"], name: "index_saved_events_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.string "address"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "phone_number"
  end

  add_foreign_key "conversion_words", "tags"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
  add_foreign_key "events", "venues"
  add_foreign_key "saved_events", "events"
  add_foreign_key "saved_events", "users"
end
