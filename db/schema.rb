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

ActiveRecord::Schema.define(version: 20131008034123) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_shops", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "street_address"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bikes", force: true do |t|
    t.date     "year_manufactured"
    t.string   "make"
    t.string   "model"
    t.string   "kind"
    t.float    "msrp"
    t.float    "current_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "make_id"
    t.integer  "model_id"
  end

  add_index "bikes", ["make"], name: "index_bikes_on_make", using: :btree
  add_index "bikes", ["model"], name: "index_bikes_on_model", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "email"
    t.string   "potential_relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree

  create_table "quotes", force: true do |t|
    t.integer  "bike_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "quotes", ["bike_id"], name: "index_quotes_on_bike_id", using: :btree
  add_index "quotes", ["customer_id"], name: "index_quotes_on_customer_id", using: :btree

  create_table "resellers", force: true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.string   "street_address"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "string"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.integer  "profile_id"
    t.string   "profile_type"
  end

end
