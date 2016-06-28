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

ActiveRecord::Schema.define(version: 20160628123354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "conversations", ["user_id"], name: "index_conversations_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "content"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "item_id",    limit: 8
    t.string   "size"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "order_id"
  end

  add_index "purchases", ["order_id"], name: "index_purchases_on_order_id", using: :btree

  create_table "queries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attr"
    t.string   "value"
    t.integer  "session_id"
  end

  add_index "queries", ["session_id"], name: "index_queries_on_session_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "facebook_id",      limit: 8
    t.jsonb    "context"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "session_id",       limit: 8
    t.string   "status"
    t.datetime "last_exchange"
    t.integer  "count_messages",             default: 0
    t.integer  "order_id"
    t.jsonb    "previous_context"
    t.string   "msg"
    t.string   "previous_message"
    t.integer  "count"
  end

  add_index "sessions", ["order_id"], name: "index_sessions_on_order_id", using: :btree

  create_table "stores", force: :cascade do |t|
    t.string   "address"
    t.string   "city"
    t.string   "country"
    t.string   "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "main_image"
    t.string   "area"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "facebook_id", limit: 8
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "purchases", "orders"
  add_foreign_key "queries", "sessions"
  add_foreign_key "sessions", "orders"
end
