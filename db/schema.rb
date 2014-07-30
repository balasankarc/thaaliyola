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

ActiveRecord::Schema.define(version: 20140730164919) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "authorships", force: true do |t|
    t.integer  "book_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: true do |t|
    t.string   "serial"
    t.string   "name"
    t.string   "shelf"
    t.string   "row"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.integer  "noofcopies"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "bookunique"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "book_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issuings", force: true do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dateofissue"
    t.date     "dateofreturn"
    t.boolean  "renewed"
  end

  create_table "languagedivisions", force: true do |t|
    t.integer  "book_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mailingusers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available"
  end

  create_table "shelfpositions", force: true do |t|
    t.integer  "book_id"
    t.integer  "shelf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shelves", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "admissionnumber", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.boolean  "librarian"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.date     "validfrom"
    t.date     "validto"
    t.integer  "book_id"
    t.date     "dateissue"
    t.date     "datereturn"
    t.float    "totalfine"
    t.string   "photourl"
    t.string   "name"
    t.string   "profpic_file_name"
    t.string   "profpic_content_type"
    t.integer  "profpic_file_size"
    t.datetime "profpic_updated_at"
    t.string   "locale"
  end

end
