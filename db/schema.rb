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

ActiveRecord::Schema.define(version: 20140506230516) do

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.integer  "household_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "household_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "welcome_party"
    t.boolean  "wedding"
    t.boolean  "breakfast"
    t.boolean  "shuttle"
    t.boolean  "is_plus_one"
    t.string   "email"
    t.boolean  "vegetarian"
    t.boolean  "plus_one_declined"
    t.datetime "response_date"
  end

  create_table "households", force: true do |t|
    t.string   "addressline1"
    t.string   "addressline2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
