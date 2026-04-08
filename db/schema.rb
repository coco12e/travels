# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_04_08_113125) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "banner_url"
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_activities_on_destination_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "favori_id"
    t.bigint "place_id"
    t.bigint "trip_id", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_bookmarks_on_place_id"
    t.index ["trip_id"], name: "index_bookmarks_on_trip_id"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.string "name"
    t.string "photo_url"
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_categories_on_destination_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "banner_url"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.bigint "continent_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["continent_id"], name: "index_countries_on_continent_id"
  end

  create_table "destinations", force: :cascade do |t|
    t.string "banner_url"
    t.bigint "continent_id", null: false
    t.datetime "created_at", null: false
    t.string "image_url"
    t.string "name"
    t.bigint "region_id", null: false
    t.datetime "updated_at", null: false
    t.index ["continent_id"], name: "index_destinations_on_continent_id"
    t.index ["region_id"], name: "index_destinations_on_region_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "arrival"
    t.string "company"
    t.string "company_return"
    t.datetime "created_at", null: false
    t.string "departure"
    t.bigint "destination_id", null: false
    t.string "duration"
    t.string "duration_return"
    t.string "land_at"
    t.string "land_at_return"
    t.string "photo"
    t.string "photo_return"
    t.string "stopover"
    t.string "stopover_return"
    t.string "take_off_at"
    t.string "take_off_at_return"
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_flights_on_destination_id"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "destination_id", null: false
    t.string "name"
    t.string "photo_url"
    t.string "sub_category"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_places_on_category_id"
    t.index ["destination_id"], name: "index_places_on_destination_id"
  end

  create_table "regions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "transports", force: :cascade do |t|
    t.text "advantages"
    t.datetime "created_at", null: false
    t.bigint "destination_id", null: false
    t.text "disadvantages"
    t.string "name"
    t.string "transport_type"
    t.datetime "updated_at", null: false
    t.index ["destination_id"], name: "index_transports_on_destination_id"
  end

  create_table "trip_transports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "transport_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_id"], name: "index_trip_transports_on_transport_id"
    t.index ["trip_id"], name: "index_trip_transports_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.boolean "confirmed"
    t.datetime "created_at", null: false
    t.text "description"
    t.bigint "destination_id", null: false
    t.integer "flight_id"
    t.string "name"
    t.bigint "transport_id"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["destination_id"], name: "index_trips_on_destination_id"
    t.index ["transport_id"], name: "index_trips_on_transport_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "destinations"
  add_foreign_key "categories", "destinations"
  add_foreign_key "countries", "continents"
  add_foreign_key "destinations", "continents"
  add_foreign_key "destinations", "regions"
  add_foreign_key "flights", "destinations"
  add_foreign_key "places", "categories"
  add_foreign_key "places", "destinations"
  add_foreign_key "transports", "destinations"
  add_foreign_key "trip_transports", "transports"
  add_foreign_key "trip_transports", "trips"
  add_foreign_key "trips", "destinations"
  add_foreign_key "trips", "transports"
  add_foreign_key "trips", "users"
end
