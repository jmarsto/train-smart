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

ActiveRecord::Schema.define(version: 2018_11_18_174336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "pt", null: false
    t.boolean "crusher", null: false
    t.boolean "days", null: false
    t.boolean "enduro", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "trainable", null: false
    t.boolean "static", null: false
    t.boolean "mental", null: false
    t.boolean "flexible", null: false
    t.boolean "tendonitis", null: false
    t.index ["user_id"], name: "index_assessments_on_user_id"
  end

  create_table "days", force: :cascade do |t|
    t.bigint "week_id"
    t.string "name", null: false
    t.index ["week_id"], name: "index_days_on_week_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.bigint "type_id"
    t.bigint "workout_id"
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_exercises_on_type_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "phases", force: :cascade do |t|
    t.bigint "plan_id"
    t.string "name"
    t.index ["plan_id"], name: "index_phases_on_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "assessment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_plans_on_assessment_id"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.bigint "phase_id"
    t.bigint "plan_id"
    t.integer "number", null: false
    t.index ["phase_id"], name: "index_weeks_on_phase_id"
    t.index ["plan_id"], name: "index_weeks_on_plan_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.bigint "day_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_workouts_on_day_id"
    t.index ["exercise_id"], name: "index_workouts_on_exercise_id"
  end

end
