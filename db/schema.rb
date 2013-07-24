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

ActiveRecord::Schema.define(:version => 20130724165335) do

  create_table "priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.float    "fp_predicted"
    t.float    "fp_realized"
    t.datetime "begin_date_predicted"
    t.datetime "end_date_predicted"
    t.datetime "begin_date_realized"
    t.datetime "end_date_realized"
    t.string   "service_code"
    t.string   "project_code"
    t.integer  "priority_id"
    t.integer  "state_id"
    t.integer  "situation_id"
    t.integer  "process_type_id"
    t.integer  "ss_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "situations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ss_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
