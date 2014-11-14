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

ActiveRecord::Schema.define(version: 20141111182418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 100, default: "", null: false
    t.string   "username",        limit: 50
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "note"
    t.string   "banner"
    t.integer  "position"
    t.boolean  "visible",     default: true
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", id: false, force: true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id", using: :btree

  create_table "lines", force: true do |t|
    t.string   "name"
    t.integer  "position"
    t.boolean  "visible",          default: false
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "gender"
    t.string   "color"
    t.string   "banner"
    t.string   "banner2"
    t.string   "logo"
    t.string   "category"
    t.text     "description_text"
  end

  add_index "lines", ["category"], name: "index_lines_on_category", using: :btree

  create_table "products", force: true do |t|
    t.integer  "line_id"
    t.string   "name"
    t.integer  "volume"
    t.integer  "price"
    t.text     "description"
    t.string   "permalink"
    t.integer  "position"
    t.boolean  "visible",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.text     "skin_type"
    t.text     "use"
    t.integer  "volume2"
    t.text     "contents"
    t.integer  "special_price"
    t.text     "note"
    t.string   "code"
    t.string   "banner"
    t.string   "code2"
    t.integer  "volume3"
    t.string   "code3"
    t.integer  "price2"
    t.integer  "special_price2"
    t.integer  "price3"
    t.integer  "special_price3"
    t.datetime "special_good_thru"
    t.datetime "special_start"
  end

  add_index "products", ["line_id"], name: "index_products_on_line_id", using: :btree
  add_index "products", ["permalink"], name: "index_products_on_permalink", using: :btree

end
