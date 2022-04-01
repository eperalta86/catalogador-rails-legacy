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

ActiveRecord::Schema.define(version: 20140209022109) do

  create_table "comments", force: true do |t|
    t.text     "mycomment"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["item_id"], name: "index_comments_on_item_id", using: :btree

  create_table "covers", force: true do |t|
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "covers", ["item_id"], name: "index_covers_on_item_id", using: :btree

  create_table "items", force: true do |t|
    t.text     "name"
    t.integer  "dvd"
    t.integer  "dvd2"
    t.text     "filename"
    t.text     "system"
    t.text     "recorded"
    t.integer  "copies"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.integer  "favorite",           limit: 1
  end

  create_table "systems", force: true do |t|
    t.string   "sysname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
