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

ActiveRecord::Schema[7.1].define(version: 2024_08_01_081040) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date"
    t.string "mode_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.string "total_seets"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer "direction_id", null: false
    t.string "bustype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["direction_id"], name: "index_buses_on_direction_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "seat_no"
    t.integer "bus_id", null: false
    t.integer "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
    t.index ["bus_id"], name: "index_tickets_on_bus_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "directions"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "tickets", "buses"
end
