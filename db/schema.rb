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

ActiveRecord::Schema[7.1].define(version: 2024_09_05_055354) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.date "date"
    t.string "mode_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bookingable_type", null: false
    t.integer "bookingable_id", null: false
    t.string "payment_intent_id"
    t.index ["bookingable_type", "bookingable_id"], name: "index_bookings_on_bookingable"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.integer "total_seets"
    t.time "departure_time"
    t.time "arrival_time"
    t.integer "direction_id", null: false
    t.string "bustype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price"
    t.integer "remaning_seats"
    t.index ["direction_id"], name: "index_buses_on_direction_id"
  end

  create_table "directions", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.integer "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "name"
    t.string "total_seets"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer "price"
    t.integer "direction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remaning_seats"
    t.index ["direction_id"], name: "index_flights_on_direction_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "bookings_id", null: false
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookings_id"], name: "index_payments_on_bookings_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "seat_no"
    t.integer "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "gender"
    t.string "name"
    t.index ["booking_id"], name: "index_tickets_on_booking_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "name"
    t.string "total_seets"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.integer "price"
    t.integer "direction_id", null: false
    t.string "traintype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remaning_seats"
    t.index ["direction_id"], name: "index_trains_on_direction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "stripe_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "directions"
  add_foreign_key "flights", "directions"
  add_foreign_key "payments", "bookings", column: "bookings_id"
  add_foreign_key "tickets", "bookings"
  add_foreign_key "trains", "directions"
end
