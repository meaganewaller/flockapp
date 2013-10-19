# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20131019160308) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "alcohol"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airports", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "location"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "airports", ["conference_id"], name: "index_airports_on_conference_id"

  create_table "conferences", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "location"
    t.string   "category"
    t.string   "safety_policty"
    t.boolean  "childcare"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.text     "location"
    t.string   "url"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "hotels", ["conference_id"], name: "index_hotels_on_conference_id"

  create_table "speakers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "url"
    t.string   "slides"
    t.text     "past_talks"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
