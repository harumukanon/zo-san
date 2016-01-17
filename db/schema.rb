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

ActiveRecord::Schema.define(version: 20160117105225) do

  create_table "editors", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "editors", ["email"], name: "index_editors_on_email", unique: true
  add_index "editors", ["reset_password_token"], name: "index_editors_on_reset_password_token", unique: true

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "year"
    t.string   "holding"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "email",      null: false
    t.string   "purpose"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "aap"
    t.string   "vap1"
    t.string   "vap2"
    t.string   "vap3"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "temp_stamp_id"
  end

  add_index "owners", ["temp_stamp_id"], name: "index_owners_on_temp_stamp_id"

  create_table "ownerships", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "stamp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ownerships", ["owner_id"], name: "index_ownerships_on_owner_id"
  add_index "ownerships", ["stamp_id"], name: "index_ownerships_on_stamp_id"

  create_table "relationships", force: :cascade do |t|
    t.integer  "stamp_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "relationships", ["item_id"], name: "index_relationships_on_item_id"
  add_index "relationships", ["stamp_id", "item_id"], name: "index_relationships_on_stamp_id_and_item_id", unique: true
  add_index "relationships", ["stamp_id"], name: "index_relationships_on_stamp_id"

  create_table "stamps", force: :cascade do |t|
    t.string   "stamp_image"
    t.string   "image_source"
    t.string   "face_string"
    t.string   "note"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
