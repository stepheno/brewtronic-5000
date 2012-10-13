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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121013205023) do

  create_table "brewers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fermenters", :force => true do |t|
    t.float    "size"
    t.string   "name"
    t.string   "fermenter_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "grain_inventories", :force => true do |t|
    t.float    "amount"
    t.integer  "grain_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "grain_supplier_id"
  end

  add_index "grain_inventories", ["grain_id"], :name => "index_grain_inventories_on_grain_id"
  add_index "grain_inventories", ["grain_supplier_id"], :name => "index_grain_inventories_on_grain_supplier_id"

  create_table "grain_suppliers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "grains", :force => true do |t|
    t.string   "name"
    t.float    "extract_potential"
    t.float    "color"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "hop_inventories", :force => true do |t|
    t.integer  "hop_id"
    t.integer  "hop_supplier_id"
    t.integer  "crop_year"
    t.float    "amount"
    t.string   "hop_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "hop_inventories", ["hop_id"], :name => "index_hop_inventories_on_hop_id"
  add_index "hop_inventories", ["hop_supplier_id"], :name => "index_hop_inventories_on_hop_supplier_id"

  create_table "hop_suppliers", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hops", :force => true do |t|
    t.string   "name"
    t.float    "alpha"
    t.integer  "hop_supplier_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.float    "beta"
  end

  add_index "hops", ["hop_supplier_id"], :name => "index_hops_on_hop_supplier_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
