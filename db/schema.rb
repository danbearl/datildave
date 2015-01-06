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

ActiveRecord::Schema.define(version: 20141231015324) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "image"
    t.integer  "priority"
  end

  create_table "orders", force: true do |t|
    t.text     "products"
    t.string   "customer_email"
    t.string   "subtotal"
    t.string   "shipping"
    t.boolean  "shipped"
    t.text     "notes"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "address_street_1"
    t.string   "address_street_2"
    t.string   "address_city"
    t.string   "address_state"
    t.string   "address_zip"
    t.boolean  "processed"
    t.string   "customer_first_name"
    t.string   "customer_last_name"
    t.string   "stripe_payment_token"
  end

  create_table "pages", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.float    "price"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "image"
    t.integer  "category_id"
    t.integer  "priority"
    t.boolean  "featured"
    t.integer  "minimum_order"
    t.boolean  "frozen_product"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
