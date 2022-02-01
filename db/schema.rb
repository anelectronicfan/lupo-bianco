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

ActiveRecord::Schema.define(version: 2022_02_01_115906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.text "name"
    t.text "gender"
    t.integer "height"
    t.integer "weight"
    t.integer "shoulders"
    t.integer "neck"
    t.integer "chest"
    t.integer "bicep"
    t.integer "forearm"
    t.integer "wrist"
    t.integer "sleeve"
    t.integer "front_length"
    t.integer "back_length"
    t.integer "mid_waist"
    t.integer "waist"
    t.integer "hip"
    t.integer "upper_thigh"
    t.integer "middle_thigh"
    t.integer "calf"
    t.integer "ankle"
    t.integer "pants_length"
    t.integer "crotch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "suits", force: :cascade do |t|
    t.text "design"
    t.text "jacket_fit"
    t.text "pants_fit"
    t.text "jacket_pocket_style"
    t.integer "jacket_pockets"
    t.integer "jacket_buttons"
    t.text "inner_lining_color"
    t.integer "vents"
    t.text "lapel"
    t.text "inner_lining_name"
    t.boolean "shirt_chest_pocket"
    t.text "shirt_collar"
    t.text "shirt_cuff"
    t.text "shirt_initials"
    t.integer "shirt_length"
    t.integer "shirt_sleeve_length"
    t.integer "extra_shirts"
    t.integer "extra_pants"
    t.integer "extra_jackets"
    t.integer "quality"
    t.integer "price"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "profile_id"
    t.integer "cart_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.text "password_digest"
    t.integer "mobile"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
