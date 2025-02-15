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

ActiveRecord::Schema[8.0].define(version: 2025_01_24_080029) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "crusts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "orderable_type", null: false
    t.integer "orderable_id", null: false
    t.integer "order_id", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["orderable_type", "orderable_id"], name: "index_order_items_on_orderable"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_name"
    t.integer "pizza_id", null: false
    t.integer "crust_id", null: false
    t.integer "quantity", null: false
    t.integer "status", default: 0
    t.integer "price"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["crust_id"], name: "index_orders_on_crust_id"
    t.index ["pizza_id"], name: "index_orders_on_pizza_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.integer "regular_price"
    t.integer "medium_price"
    t.integer "large_price"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["category_id"], name: "index_pizzas_on_category_id"
  end

  create_table "side_items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.index ["category_id"], name: "index_toppings_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "crusts"
  add_foreign_key "orders", "pizzas"
  add_foreign_key "orders", "users"
  add_foreign_key "pizzas", "categories"
  add_foreign_key "toppings", "categories"
end
