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

ActiveRecord::Schema.define(version: 20160217113658) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image",       limit: 255
    t.integer  "priority"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "quantity"
    t.string   "name"
    t.string   "preparation"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "products"
    t.string   "customer_email",       limit: 255
    t.string   "subtotal",             limit: 255
    t.string   "shipping",             limit: 255
    t.boolean  "shipped"
    t.text     "notes"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "address_street_1",     limit: 255
    t.string   "address_street_2",     limit: 255
    t.string   "address_city",         limit: 255
    t.string   "address_state",        limit: 255
    t.string   "address_zip",          limit: 255
    t.boolean  "processed"
    t.string   "customer_first_name",  limit: 255
    t.string   "customer_last_name",   limit: 255
    t.string   "stripe_payment_token", limit: 255
  end

  create_table "pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "body"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "quantity",                   default: 0
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image",          limit: 255
    t.integer  "category_id"
    t.integer  "priority"
    t.boolean  "featured"
    t.integer  "minimum_order"
    t.boolean  "frozen_product"
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.text     "instructions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "email",         limit: 255
    t.string   "password_hash", limit: 255
    t.string   "password_salt", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
