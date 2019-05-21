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

ActiveRecord::Schema.define(version: 2019_05_20_205332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "requested_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "interested_in_investing", default: false
    t.boolean "interested_in_advisor", default: false
    t.boolean "interested_in_purchasing", default: false
  end

  create_table "tokens", force: :cascade do |t|
    t.integer "user_id"
    t.string "token"
  end

  create_table "users", force: :cascade do |t|
    t.integer "role"
    t.string "name"
    t.string "surname"
    t.string "email"
    t.string "password"
    t.string "goals"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_email_notifications_available", default: false
    t.integer "phone"
  end

end