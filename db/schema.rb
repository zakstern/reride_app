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

ActiveRecord::Schema.define(version: 20131023222028) do

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
    t.string   "kind"
    t.float    "msrp"
    t.float    "current_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "side_picture_file_name"
    t.string   "side_picture_content_type"
    t.integer  "side_picture_file_size"
    t.datetime "side_picture_updated_at"
    t.integer  "make_id"
    t.integer  "model_id"
    t.integer  "year_id"
    t.decimal  "quote_value",               precision: 8, scale: 2
    t.decimal  "like_new_value",            precision: 8, scale: 2
    t.decimal  "excellent_value",           precision: 8, scale: 2
    t.decimal  "fair_value",                precision: 8, scale: 2
    t.decimal  "good_value",                precision: 8, scale: 2
  end

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

  create_table "makes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "models", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "make_id"
  end

  create_table "quotes", force: true do |t|
    t.integer  "bike_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "side_picture_file_name"
    t.string   "side_picture_content_type"
    t.integer  "side_picture_file_size"
    t.datetime "side_picture_updated_at"
    t.string   "front_picture_file_name"
    t.string   "front_picture_content_type"
    t.integer  "front_picture_file_size"
    t.datetime "front_picture_updated_at"
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

  create_table "versions", force: true do |t|
    t.integer  "model_id"
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "versions", ["model_id"], name: "index_versions_on_model_id", using: :btree
  add_index "versions", ["year_id"], name: "index_versions_on_year_id", using: :btree

  create_table "years", force: true do |t|
    t.integer  "year_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "model_id"
  end

end
