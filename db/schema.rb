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

ActiveRecord::Schema.define(version: 2022_09_27_165507) do

  create_table "boards", force: :cascade do |t|
    t.string "visibility"
    t.string "name"
    t.string "description"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_boards_on_user_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "color"
    t.string "name"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "priority"
    t.integer "board_id", null: false
    t.index ["board_id"], name: "index_lists_on_board_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "quantity_members"
    t.integer "duration"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "task_labels", force: :cascade do |t|
    t.integer "task_id"
    t.integer "label_id"
    t.index ["label_id"], name: "index_task_labels_on_label_id"
    t.index ["task_id"], name: "index_task_labels_on_task_id"
  end

  create_table "tasks", primary_key: "task_id", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.integer "doing_time"
    t.string "justification"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "list_id", null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "surname"
    t.boolean "security_updates"
    t.string "authorization_tier"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "users"
  add_foreign_key "lists", "boards"
  add_foreign_key "plans", "users"
  add_foreign_key "tasks", "lists"
end
