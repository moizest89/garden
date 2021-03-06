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

ActiveRecord::Schema.define(version: 20160430182845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "banner_image_url"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "families", force: :cascade do |t|
    t.text     "description"
    t.string   "banner"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "family_images", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "family_id"
  end

  add_index "family_images", ["family_id"], name: "index_family_images_on_family_id", using: :btree

  create_table "tip_images", force: :cascade do |t|
    t.text     "description"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tip_id"
    t.string   "name"
  end

  add_index "tip_images", ["tip_id"], name: "index_tip_images_on_tip_id", using: :btree

  create_table "tips", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "tips", ["category_id"], name: "index_tips_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "zone_families", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "zone_id"
    t.integer  "family_id"
  end

  add_index "zone_families", ["family_id"], name: "index_zone_families_on_family_id", using: :btree
  add_index "zone_families", ["zone_id"], name: "index_zone_families_on_zone_id", using: :btree

  create_table "zones", force: :cascade do |t|
    t.string   "banner"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "position"
  end

  add_foreign_key "family_images", "families"
  add_foreign_key "tip_images", "tips"
  add_foreign_key "tips", "categories"
  add_foreign_key "zone_families", "families"
  add_foreign_key "zone_families", "zones"
end
