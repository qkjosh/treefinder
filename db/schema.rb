# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_15_045356) do

  create_table "families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genera", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "family_id", null: false
    t.index ["family_id"], name: "index_genera_on_family_id"
  end

  create_table "park_plants", force: :cascade do |t|
    t.integer "diameter"
    t.decimal "latitude", precision: 17, scale: 14
    t.decimal "longitude", precision: 17, scale: 14
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "plant_id", null: false
    t.integer "park_id", null: false
    t.index ["park_id"], name: "index_park_plants_on_park_id"
    t.index ["plant_id"], name: "index_park_plants_on_plant_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.decimal "latitude", precision: 17, scale: 14
    t.decimal "longitude", precision: 17, scale: 14
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "common_name"
    t.string "scientific_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "family_id"
    t.integer "genus_id"
    t.index ["family_id"], name: "index_plants_on_family_id"
    t.index ["genus_id"], name: "index_plants_on_genus_id"
  end

  add_foreign_key "genera", "families"
  add_foreign_key "park_plants", "parks"
  add_foreign_key "park_plants", "plants"
  add_foreign_key "plants", "families"
  add_foreign_key "plants", "genera"
end
