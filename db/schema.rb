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

ActiveRecord::Schema.define(version: 20170125082239) do

  create_table "link_tables", force: :cascade do |t|
    t.string   "creator_user_id",         limit: 255,                 null: false
    t.string   "target_user_id",          limit: 255,                 null: false
    t.boolean  "target_permission_grant",             default: false
    t.datetime "created_at",                                          null: false
    t.string   "tracker_id",              limit: 255
    t.string   "job_time_interval",       limit: 255
    t.string   "job_time_out",            limit: 255
  end

  create_table "logs", force: :cascade do |t|
    t.float    "latitude",        limit: 53
    t.float    "longitude",       limit: 53
    t.string   "timezone_str",    limit: 255
    t.string   "timezone_id",     limit: 255
    t.datetime "created_at"
    t.string   "tracker_id",      limit: 255
    t.string   "status_of_valid", limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",               limit: 255,                    null: false
    t.string   "email",              limit: 255,                    null: false
    t.string   "user_type",          limit: 7,   default: "target"
    t.string   "image",              limit: 255
    t.datetime "created_at",                                        null: false
    t.boolean  "verified_email",                 default: false
    t.boolean  "verified_phone",                 default: false
    t.string   "description",        limit: 255
    t.string   "password_digest",    limit: 255
    t.string   "track_id_reg",       limit: 255
    t.integer  "phone",              limit: 8
    t.boolean  "isOnline",                       default: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

end
