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

ActiveRecord::Schema.define(version: 20130811175243) do

  create_table "adhoc_messages", force: true do |t|
    t.boolean  "isNew"
    t.integer  "student_id"
    t.integer  "recipient_id"
    t.integer  "sender_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adhoc_messages", ["student_id"], name: "index_adhoc_messages_on_student_id", using: :btree

  create_table "adhoc_messages_feedbacks", id: false, force: true do |t|
    t.integer "adhoc_message_id", null: false
    t.integer "feedback_id",      null: false
  end

  add_index "adhoc_messages_feedbacks", ["adhoc_message_id", "feedback_id"], name: "ad_m_f_index", unique: true, using: :btree

  create_table "feedbacks", force: true do |t|
    t.text     "comment"
    t.string   "criteria"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: true do |t|
    t.string   "code"
    t.string   "english_name"
    t.string   "native_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_classes", force: true do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "student_class_id"
    t.string   "gender"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grade"
    t.text     "comment"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "students", ["parent_id"], name: "index_students_on_parent_id", using: :btree
  add_index "students", ["student_class_id"], name: "index_students_on_student_class_id", using: :btree

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.string   "grade"
    t.integer  "student_id"
    t.integer  "feedback_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["feedback_id"], name: "index_subjects_on_feedback_id", using: :btree
  add_index "subjects", ["student_id"], name: "index_subjects_on_student_id", using: :btree

  create_table "translations", force: true do |t|
    t.integer  "language_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feedback_id"
  end

  add_index "translations", ["language_id"], name: "index_translations_on_language_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "language_id"
    t.string   "gender"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
