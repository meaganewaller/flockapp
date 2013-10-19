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

ActiveRecord::Schema.define(version: 20131019032432) do

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
  end

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
