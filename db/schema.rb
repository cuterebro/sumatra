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

ActiveRecord::Schema[8.1].define(version: 2025_11_22_181942) do
  create_table "feeds", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "default", default: false, null: false
    t.bigint "space_id", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_feeds_on_space_id"
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "name"
    t.bigint "space_id", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id", "name"], name: "index_profiles_on_space_id_and_name", unique: true
    t.index ["space_id"], name: "index_profiles_on_space_id"
  end

  create_table "spaces", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "host", null: false
    t.string "mode", default: "public", null: false
    t.string "title", default: "", null: false
    t.datetime "updated_at", null: false
    t.index ["host"], name: "index_spaces_on_host", unique: true
  end

  create_table "user_profiles", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "user_id", null: false
    t.index ["profile_id"], name: "index_user_profiles_on_profile_id"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_bin", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "name", null: false
    t.bigint "space_id", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id", "email"], name: "index_users_on_space_id_and_email", unique: true
    t.index ["space_id", "name"], name: "index_users_on_space_id_and_name", unique: true
    t.index ["space_id"], name: "index_users_on_space_id"
  end

  add_foreign_key "feeds", "spaces"
  add_foreign_key "profiles", "spaces"
  add_foreign_key "user_profiles", "profiles"
  add_foreign_key "user_profiles", "users"
  add_foreign_key "users", "spaces"
end
