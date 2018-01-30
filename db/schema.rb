# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20180130020939) do

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "lesson"
    t.boolean  "correct"
  end

  create_table "lessons", force: :cascade do |t|
    t.text     "title"
    t.text     "video"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
    t.string   "cover"
    t.string   "pdf"
    t.string   "excel"
    t.string   "doc"
    t.string   "shortDesc"
  end

  create_table "promos", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "maximum",    default: 0
    t.string   "code"
    t.integer  "used",       default: 0
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "quiz_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "correct"
  end

  create_table "quizresults", force: :cascade do |t|
    t.integer  "correct"
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.integer  "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.integer  "ref"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "content"
  end

  create_table "results", force: :cascade do |t|
    t.integer  "correct"
    t.string   "user_id"
    t.string   "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "total"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "enrolled",               default: true
    t.integer  "progress",               default: 0
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "school"
    t.string   "referral"
    t.string   "age"
    t.string   "phone"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "card_number"
    t.string   "card_name"
    t.integer  "card_exp_year"
    t.integer  "card_exp_month"
    t.integer  "card_cvv"
    t.string   "promo"
    t.boolean  "two_week",               default: false
    t.boolean  "completed",              default: false
    t.boolean  "banhammer",              default: false
    t.boolean  "auto_renew",             default: true
    t.boolean  "subscribed"
    t.string   "stripeid"
    t.string   "subsriptionId"
    t.integer  "score",                  default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
