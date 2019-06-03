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

ActiveRecord::Schema.define(version: 2019_06_03_190557) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_users", id: false, force: :cascade do |t|
    t.bigint "feature_id", null: false
    t.bigint "user_id", null: false
    t.index ["feature_id", "user_id"], name: "index_features_users_on_feature_id_and_user_id"
    t.index ["user_id", "feature_id"], name: "index_features_users_on_user_id_and_feature_id"
  end

  create_table "lands", force: :cascade do |t|
    t.string "address"
    t.bigint "neighborhood_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "mapframe"
    t.text "why_we_like_it"
    t.index ["neighborhood_id"], name: "index_lands_on_neighborhood_id"
  end

  create_table "location_perks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_perks_users", id: false, force: :cascade do |t|
    t.bigint "location_perk_id", null: false
    t.bigint "user_id", null: false
    t.index ["location_perk_id", "user_id"], name: "index_location_perks_users_on_location_perk_id_and_user_id"
    t.index ["user_id", "location_perk_id"], name: "index_location_perks_users_on_user_id_and_location_perk_id"
  end

  create_table "nearby_locations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "land_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "within_10"
    t.boolean "within_mile"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "mapframe"
    t.text "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "housing_option"
    t.string "state"
    t.string "city"
    t.integer "preferred_bedroom"
    t.float "preferred_bathroom"
    t.string "move_in_time"
    t.integer "budget"
    t.boolean "pre_approved_mortgage"
    t.string "first_name"
    t.string "last_name"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean "valid_age"
    t.boolean "terms_agreement"
    t.boolean "feedback", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lands", "neighborhoods"
end
