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

ActiveRecord::Schema.define(version: 20140925010634) do

  create_table "admins", force: true do |t|
    t.string  "user_id", null: false
    t.string  "name"
    t.string  "email"
    t.boolean "pending"
  end

  create_table "categories", force: true do |t|
    t.string "name", null: false
  end

  create_table "employers", force: true do |t|
    t.string  "user_id",      null: false
    t.string  "name"
    t.string  "company_name"
    t.string  "email"
    t.boolean "pending"
  end

  create_table "job_applications", force: true do |t|
    t.integer  "job_id",       null: false
    t.integer  "employer_id",  null: false
    t.integer  "seeker_id",    null: false
    t.integer  "status_id",    null: false
    t.text     "cover_letter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string  "title",       null: false
    t.integer "employer_id", null: false
    t.integer "category_id", null: false
  end

  create_table "seekers", force: true do |t|
    t.string  "user_id", null: false
    t.integer "phone"
    t.string  "name"
    t.string  "email"
    t.text    "resume"
  end

  create_table "statuses", force: true do |t|
    t.string "title", null: false
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
