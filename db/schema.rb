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

ActiveRecord::Schema[8.0].define(version: 2025_04_19_234054) do
  create_table "catchups", force: :cascade do |t|
    t.integer "contact_id", null: false
    t.string "prompt", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_catchups_on_contact_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts_users", id: false, force: :cascade do |t|
    t.integer "contact_id"
    t.integer "user_id"
    t.index ["contact_id"], name: "index_contacts_users_on_contact_id"
    t.index ["user_id"], name: "index_contacts_users_on_user_id"
  end

  create_table "facts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "question", null: false
    t.string "answer", null: false
    t.index ["user_id"], name: "index_facts_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content", null: false
    t.integer "user_id", null: false
    t.integer "catchup_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catchup_id"], name: "index_messages_on_catchup_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "short", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "onboarded", default: false, null: false
  end

  add_foreign_key "catchups", "contacts"
  add_foreign_key "facts", "users"
  add_foreign_key "messages", "catchups"
  add_foreign_key "messages", "users"
  add_foreign_key "sessions", "users"
end
