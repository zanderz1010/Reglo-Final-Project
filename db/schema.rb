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

ActiveRecord::Schema.define(version: 2022_08_16_041752) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "gifts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_category_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.float "price"
    t.string "status_of_gift"
    t.text "description"
    t.integer "category_id"
    t.string "name_of_gift"
    t.integer "requester_id"
    t.integer "buyer_id"
    t.integer "where_to_buys_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string "website"
    t.string "location"
    t.string "name_of_shop"
    t.integer "where_to_buys_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "shareable_tag"
    t.string "bio"
    t.string "profile_image"
    t.integer "requested_gifts_count"
    t.integer "bought_gifts_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "where_to_buys", force: :cascade do |t|
    t.integer "gift_id"
    t.integer "shop_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
