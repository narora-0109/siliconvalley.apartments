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

ActiveRecord::Schema.define(version: 20170508010723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "listings", force: :cascade do |t|
    t.float     "price"
    t.string    "streetname"
    t.string    "city"
    t.string    "zipcode"
    t.datetime  "created_at",                                                                null: false
    t.datetime  "updated_at",                                                                null: false
    t.string    "status"
    t.string    "latitude"
    t.string    "longitude"
    t.integer   "streetnum"
    t.string    "country"
    t.string    "state"
    t.text      "property_desc"
    t.string    "property_type"
    t.integer   "sq_ft"
    t.integer   "bedrooms"
    t.integer   "bathrooms"
    t.string    "pets"
    t.string    "leasing_fees"
    t.integer   "unit_num"
    t.integer   "user_id"
    t.geography "coordinates",   limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
  end

  create_table "pictures", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "listing_id"
    t.string   "picture_json"
    t.index ["listing_id"], name: "index_pictures_on_listing_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "phoneNum"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "email"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

end
