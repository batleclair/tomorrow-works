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

ActiveRecord::Schema[7.0].define(version: 2022_06_02_141315) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "candidatures", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "offer_id", null: false
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "motivation"
    t.index ["candidate_id"], name: "index_candidatures_on_candidate_id"
    t.index ["offer_id"], name: "index_candidatures_on_offer_id"
    t.index ["user_id"], name: "index_candidatures_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sector"
    t.string "address"
    t.text "status"
    t.string "siret"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.bigint "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_experiences_on_candidate_id"
  end

  create_table "nonprofits", force: :cascade do |t|
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
    t.index ["user_id"], name: "index_nonprofits_on_user_id"
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
    t.bigint "nonprofit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nonprofit_id"], name: "index_offers_on_nonprofit_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applications", "candidates"
  add_foreign_key "applications", "offers"
  add_foreign_key "applications", "users"
  add_foreign_key "candidates", "companies"
  add_foreign_key "candidates", "users"
  add_foreign_key "candidatures", "candidates"
  add_foreign_key "candidatures", "offers"
  add_foreign_key "candidatures", "users"
  add_foreign_key "companies", "users"
  add_foreign_key "experiences", "candidates"
  add_foreign_key "nonprofits", "users"
  add_foreign_key "offers", "nonprofits"
  add_foreign_key "offers", "users"
end
