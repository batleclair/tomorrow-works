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

ActiveRecord::Schema[7.0].define(version: 2022_05_31_100415) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "user_id", null: false
    t.bigint "candidate_id", null: false
    t.text "message"
    t.text "motivation"
    t.string "step"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_applications_on_candidate_id"
    t.index ["offer_id"], name: "index_applications_on_offer_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "associations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "mission"
    t.string "legal_form"
    t.string "address"
    t.string "sector"
    t.text "description"
    t.string "siret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.index ["user_id"], name: "index_associations_on_user_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.date "birthdate"
    t.integer "availability"
    t.string "expertise"
    t.string "location"
    t.string "linkedin_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_candidates_on_company_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_experiences_on_candidate_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "start_date"
    t.integer "duration"
    t.text "description"
    t.integer "frequency"
    t.string "location"
    t.string "title"
    t.text "expertise"
    t.integer "salary"
    t.bigint "association_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["association_id"], name: "index_offers_on_association_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "candidates"
  add_foreign_key "applications", "offers"
  add_foreign_key "applications", "users"
  add_foreign_key "associations", "users"
  add_foreign_key "candidates", "companies"
  add_foreign_key "candidates", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "experiences", "candidates"
  add_foreign_key "offers", "associations"
  add_foreign_key "offers", "users"
end
