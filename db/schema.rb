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

ActiveRecord::Schema.define(version: 2018_11_12_231034) do

  create_table "histories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "requester_id"
    t.string "status"
    t.bigint "owner_id"
    t.bigint "project_id"
    t.text "description"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "deadline"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "fk_rails_5d79e6fbe6"
    t.index ["project_id"], name: "fk_rails_b49d1546aa"
    t.index ["requester_id"], name: "fk_rails_44c8a482d4"
    t.index ["status"], name: "index_histories_on_status"
  end

  create_table "persons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "manager_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["manager_id"], name: "fk_rails_2f33b24e0d"
  end

  create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "description"
    t.bigint "history_id"
    t.boolean "done"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["history_id"], name: "fk_rails_f9a3ce008a"
  end

  add_foreign_key "histories", "persons", column: "owner_id"
  add_foreign_key "histories", "persons", column: "requester_id"
  add_foreign_key "histories", "projects"
  add_foreign_key "projects", "persons", column: "manager_id"
  add_foreign_key "tasks", "histories"
end
