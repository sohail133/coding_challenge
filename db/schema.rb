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

ActiveRecord::Schema[7.0].define(version: 2023_10_16_102343) do
  create_table "discount_codes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_orders", force: :cascade do |t|
    t.integer "discount_code_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_code_id"], name: "index_discount_orders_on_discount_code_id"
    t.index ["order_id"], name: "index_discount_orders_on_order_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "instructions"
    t.decimal "price"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promo_codes", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promo_orders", force: :cascade do |t|
    t.integer "promo_code_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_promo_orders_on_order_id"
    t.index ["promo_code_id"], name: "index_promo_orders_on_promo_code_id"
  end

end
