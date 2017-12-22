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

ActiveRecord::Schema.define(version: 20171222150456) do

  create_table "addresses", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "address"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "comment"
    t.string "addressable_type"
    t.integer "addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "logo"
    t.boolean "is_del", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "city_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_cities_on_category_id"
    t.index ["city_id"], name: "index_categories_cities_on_city_id"
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_del"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "city_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_users_on_city_id"
    t.index ["user_id"], name: "index_cities_users_on_user_id"
  end

  create_table "cities_workers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "city_id"
    t.integer "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_workers_on_city_id"
    t.index ["worker_id"], name: "index_cities_workers_on_worker_id"
  end

  create_table "coupon_lists", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "validity_type"
    t.date "valid_from"
    t.date "valid_to"
    t.integer "fixed_begin_term"
    t.integer "fixed_term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "coupon_list_id"
    t.integer "user_id"
    t.date "valid_from"
    t.date "valid_to"
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_list_id"], name: "index_coupons_on_coupon_list_id"
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "couriers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_checked", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.string "idcard"
    t.index ["city_id"], name: "index_couriers_on_city_id"
    t.index ["email"], name: "index_couriers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_couriers_on_reset_password_token", unique: true
  end

  create_table "couriers_stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "courier_id"
    t.integer "station_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["courier_id"], name: "index_couriers_stations_on_courier_id"
    t.index ["station_id"], name: "index_couriers_stations_on_station_id"
  end

  create_table "items", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "amount"
    t.float "price", limit: 24
    t.integer "product_id"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_items_on_order_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "order_promotions", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "kind"
    t.float "discount", limit: 24
    t.float "premise", limit: 24
    t.integer "coupon_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_list_id"], name: "index_order_promotions_on_coupon_list_id"
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.bigint "user_id"
    t.bigint "user_address_id"
    t.float "total_price", limit: 24
    t.string "courier_status"
    t.integer "voucher_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["category_id"], name: "index_orders_on_category_id"
    t.index ["city_id"], name: "index_orders_on_city_id"
    t.index ["user_address_id"], name: "index_orders_on_user_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "price_rules", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "grade"
    t.integer "city_id"
    t.integer "category_id"
    t.date "from_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_price_rules_on_category_id"
    t.index ["city_id"], name: "index_price_rules_on_city_id"
  end

  create_table "prices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "price1", limit: 24, default: 0.0
    t.float "price2", limit: 24, default: 0.0
    t.float "price3", limit: 24, default: 0.0
    t.float "price4", limit: 24, default: 0.0
    t.float "price5", limit: 24, default: 0.0
    t.float "price6", limit: 24, default: 0.0
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_prices_on_product_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "logo"
    t.boolean "is_del", default: false
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "display_name"
    t.string "comment"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "stations", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "is_del", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_stations_on_city_id"
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_user_addresses_on_city_id"
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "user_card_charge_settings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "min", limit: 24, default: 0.0
    t.float "money_give", limit: 24, default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_card_logs", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "kind", default: 0
    t.float "real_money", limit: 24, default: 0.0
    t.float "fake_money", limit: 24, default: 0.0
    t.string "loggable_type"
    t.integer "loggable_id"
    t.integer "user_card_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["loggable_type", "loggable_id"], name: "index_user_card_logs_on_loggable_type_and_loggable_id"
    t.index ["user_card_id"], name: "index_user_card_logs_on_user_card_id"
  end

  create_table "user_cards", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "real_money", limit: 24, default: 0.0
    t.float "fake_money", limit: 24, default: 0.0
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_cards_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "phoneno"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phoneno"], name: "index_users_on_phoneno", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "vouchers", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "order_id"
    t.integer "status", default: 0
    t.datetime "payed_at"
    t.float "money", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "user_card_pay", limit: 24, default: 0.0
    t.float "coupon_pay", limit: 24, default: 0.0
    t.bigint "coupon_id"
    t.index ["coupon_id"], name: "index_vouchers_on_coupon_id"
    t.index ["order_id"], name: "index_vouchers_on_order_id"
  end

  create_table "waybills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "order_id"
    t.string "status"
    t.string "sender_type"
    t.bigint "sender_id"
    t.bigint "from_address_id"
    t.string "receiver_type"
    t.bigint "receiver_id"
    t.bigint "to_address_id"
    t.datetime "exp_time"
    t.datetime "actual_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["from_address_id"], name: "index_waybills_on_from_address_id"
    t.index ["order_id"], name: "index_waybills_on_order_id"
    t.index ["receiver_type", "receiver_id"], name: "index_waybills_on_receiver_type_and_receiver_id"
    t.index ["sender_type", "sender_id"], name: "index_waybills_on_sender_type_and_sender_id"
    t.index ["to_address_id"], name: "index_waybills_on_to_address_id"
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_workers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true
  end

  create_table "workers_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "worker_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_workers_roles_on_role_id"
    t.index ["worker_id", "role_id"], name: "index_workers_roles_on_worker_id_and_role_id"
    t.index ["worker_id"], name: "index_workers_roles_on_worker_id"
  end

  add_foreign_key "coupons", "coupon_lists"
  add_foreign_key "products", "categories"
  add_foreign_key "user_addresses", "users"
end
