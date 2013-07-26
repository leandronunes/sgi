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

ActiveRecord::Schema.define(:version => 20130726010059) do

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "appropriations", :force => true do |t|
    t.datetime "date"
    t.float    "time"
    t.integer  "project_id"
    t.integer  "worker_id"
    t.integer  "task_type_id"
    t.integer  "activity_id"
    t.integer  "time_type_id"
    t.integer  "input_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inputs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "localizations", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.float    "predicted_effort"
    t.float    "percent_complete"
    t.datetime "begin_date_predicted"
    t.datetime "end_date_predicted"
    t.datetime "begin_date_realized"
    t.datetime "end_date_realized"
    t.string   "code"
    t.string   "name"
    t.integer  "priority_id"
    t.integer  "state_id"
    t.integer  "situation_id"
    t.integer  "process_type_id"
    t.integer  "ss_type_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "localization_id"
  end

  create_table "services", :force => true do |t|
    t.string   "code"
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

  create_table "task_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workers", :force => true do |t|
    t.string   "registration"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
