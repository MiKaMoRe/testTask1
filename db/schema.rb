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

ActiveRecord::Schema[7.1].define(version: 2024_09_09_093314) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "gender", ["male", "female"]

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "interest_id", null: false
    t.index ["interest_id", "user_id"], name: "index_interests_users_on_interest_id_and_user_id", unique: true
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "skill_id", null: false
    t.index ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "surname", limit: 255, null: false
    t.string "patronymic", limit: 255, null: false
    t.string "full_name", null: false
    t.string "email", limit: 320, null: false
    t.integer "age", limit: 2, null: false
    t.string "nationality", limit: 255, null: false
    t.string "country", limit: 255, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.enum "gender", null: false, enum_type: "gender"
  end

end
