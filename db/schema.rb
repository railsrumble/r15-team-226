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

ActiveRecord::Schema.define(version: 20151108054242) do

  create_table "adoption_requests", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "pet_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "adoption_requests", ["owner_id"], name: "index_adoption_requests_on_owner_id"
  add_index "adoption_requests", ["pet_id"], name: "index_adoption_requests_on_pet_id"

  create_table "adoption_responses", force: :cascade do |t|
    t.integer  "adoption_request_id"
    t.integer  "owner_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "file_uid"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.text     "content"
  end

  create_table "discussions", force: :cascade do |t|
    t.string   "topic"
    t.text     "content"
    t.string   "discussion_type"
    t.string   "breed"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.boolean  "read",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "contact_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "owners", ["confirmation_token"], name: "index_owners_on_confirmation_token", unique: true
  add_index "owners", ["email"], name: "index_owners_on_email", unique: true
  add_index "owners", ["reset_password_token"], name: "index_owners_on_reset_password_token", unique: true

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
    t.integer  "owner_id"
    t.string   "latitude"
    t.string   "longitude"
  end

end
