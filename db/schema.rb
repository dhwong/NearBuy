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

ActiveRecord::Schema.define(version: 20150402231720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "article_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inventory_items", force: true do |t|
    t.integer  "store_id"
    t.integer  "item_id"
    t.integer  "price_in_cents"
    t.integer  "in_stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "inventory_items", ["item_id"], name: "index_inventory_items_on_item_id", using: :btree
  add_index "inventory_items", ["store_id"], name: "index_inventory_items_on_store_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "brand"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["name"], name: "index_items_on_name", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.text     "title"
    t.text     "body"
    t.date     "date"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", force: true do |t|
    t.integer  "owner"
    t.string   "name"
    t.string   "location"
    t.string   "store_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["name"], name: "index_stores_on_name", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "fname"
    t.string   "lname"
    t.boolean  "isOwner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "widgets", force: true do |t|
    t.text     "title"
    t.text     "content"
    t.boolean  "cool"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
