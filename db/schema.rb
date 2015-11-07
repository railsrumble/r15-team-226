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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151107060348) do
=======
ActiveRecord::Schema.define(version: 20151107054414) do
>>>>>>> 3f87f65f8b184a31379449f0fb95be088da11311

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "disucssions", force: :cascade do |t|
    t.string   "topic"
    t.text     "content"
    t.string   "type"
    t.string   "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
<<<<<<< HEAD
    t.boolean  "read",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
=======
    t.boolean  "read"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
>>>>>>> 3f87f65f8b184a31379449f0fb95be088da11311
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "contact_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string   "pet_type"
    t.string   "breed"
    t.string   "gender"
    t.integer  "age"
    t.string   "name"
    t.text     "area"
    t.string   "color"
    t.text     "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
<<<<<<< HEAD
=======
    t.integer  "owner_id"
>>>>>>> 3f87f65f8b184a31379449f0fb95be088da11311
  end

end
