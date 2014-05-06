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

ActiveRecord::Schema.define(version: 20140506081704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "setting_groups", force: true do |t|
    t.integer  "theme_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "setting_groups", ["theme_id"], name: "index_setting_groups_on_theme_id", using: :btree

  create_table "settings", force: true do |t|
    t.integer  "setting_group_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["setting_group_id"], name: "index_settings_on_setting_group_id", using: :btree

  create_table "themes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "provider"
    t.integer  "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
