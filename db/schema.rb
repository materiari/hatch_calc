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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140711163806) do

  create_table "weeks", :force => true do |t|
    t.integer  "week_number"
    t.date     "starting"
    t.date     "ending"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "weeks", ["starting", "ending"], :name => "index_weeks_on_starting_and_ending"

  create_table "workouts", :force => true do |t|
    t.integer  "week"
    t.integer  "day"
    t.string   "lift"
    t.integer  "set_number"
    t.integer  "reps"
    t.float    "percentage"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "workouts", ["week", "day"], :name => "index_workouts_on_week_and_day"

end
