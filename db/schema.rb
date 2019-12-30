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

ActiveRecord::Schema.define(version: 2019_12_30_082643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "Address_line_1"
    t.string "Address_line_2"
    t.string "Address_line_3"
    t.string "city"
    t.string "pin"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.bigint "state_id"
    t.bigint "addresstype_id"
    t.index ["addresstype_id"], name: "index_addresses_on_addresstype_id"
    t.index ["country_id"], name: "index_addresses_on_country_id"
    t.index ["employee_id"], name: "index_addresses_on_employee_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "addresstypes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "designations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "designation_id"
    t.index ["designation_id"], name: "index_employees_on_designation_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  add_foreign_key "addresses", "employees"
  add_foreign_key "states", "countries"
end
