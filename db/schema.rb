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

ActiveRecord::Schema.define(version: 20150608083226) do

  create_table "articles", force: true do |t|
    t.string   "subject"
    t.text     "description"
    t.boolean  "status"
    t.date     "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "article_id"
    t.string   "guest_name"
    t.string   "guest_email"
    t.text     "comment"
    t.date     "comment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
