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

ActiveRecord::Schema.define(version: 20180802181154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "destinations", force: :cascade do |t|
    t.bigint "tour_package_id"
    t.string "point"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["tour_package_id"], name: "index_destinations_on_tour_package_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "tour_booking_id"
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_booking_id"], name: "index_passengers_on_tour_booking_id"
  end

  create_table "tour_bookings", force: :cascade do |t|
    t.bigint "tour_package_id"
    t.string "name"
    t.string "contact"
    t.text "address"
    t.integer "number_of_people"
    t.boolean "confirmation", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tour_package_id"], name: "index_tour_bookings_on_tour_package_id"
  end

  create_table "tour_packages", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.integer "age_from"
    t.integer "age_upto"
    t.integer "max_people"
    t.float "cost_per_person"
    t.date "last_submission_date"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tour_packages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "user_type", default: "GUEST"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "destinations", "tour_packages"
  add_foreign_key "passengers", "tour_bookings"
  add_foreign_key "tour_bookings", "tour_packages"
  add_foreign_key "tour_packages", "users"
end
