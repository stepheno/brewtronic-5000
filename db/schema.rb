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

ActiveRecord::Schema.define(:version => 20121017042735) do

  create_table "batches", :force => true do |t|
    t.integer  "recipe_id"
    t.date     "date"
    t.integer  "fermenter_id"
    t.integer  "brewer_id"
    t.float    "original_gravity"
    t.float    "finish_gravity"
    t.float    "yield"
    t.date     "target_date"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "batches", ["brewer_id"], :name => "index_batches_on_brewer_id"
  add_index "batches", ["fermenter_id"], :name => "index_batches_on_fermenter_id"
  add_index "batches", ["recipe_id"], :name => "index_batches_on_recipe_id"

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

  create_table "mash_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "minerals", :force => true do |t|
    t.string   "name"
    t.float    "calcium"
    t.float    "magnesium"
    t.float    "sodium"
    t.float    "sulfate"
    t.float    "carbonate"
    t.float    "chloride"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.integer  "category"
    t.integer  "sub_category"
    t.float    "og_range_low"
    t.float    "og_range_high"
    t.float    "fg_range_low"
    t.float    "fg_range_high"
    t.float    "ibu_range_low"
    t.float    "ibu_range_high"
    t.float    "srm_range_low"
    t.float    "srm_range_high"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "recipe_grains", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "grain_id"
    t.float    "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "recipe_grains", ["grain_id"], :name => "index_recipe_grains_on_grain_id"
  add_index "recipe_grains", ["recipe_id"], :name => "index_recipe_grains_on_recipe_id"

  create_table "recipe_hops", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "hop_id"
    t.float    "amount"
    t.float    "time"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "recipe_hops", ["hop_id"], :name => "index_recipe_hops_on_hop_id"
  add_index "recipe_hops", ["recipe_id"], :name => "index_recipe_hops_on_recipe_id"

  create_table "recipe_mashes", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "mash_type_id"
    t.float    "time"
    t.float    "temperature"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "recipe_mashes", ["mash_type_id"], :name => "index_recipe_mashes_on_mash_type_id"
  add_index "recipe_mashes", ["recipe_id"], :name => "index_recipe_mashes_on_recipe_id"

  create_table "recipe_minerals", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "mineral_id"
    t.float    "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "recipe_minerals", ["mineral_id"], :name => "index_recipe_minerals_on_mineral_id"
  add_index "recipe_minerals", ["recipe_id"], :name => "index_recipe_minerals_on_recipe_id"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "style_id"
    t.float    "target_og"
    t.float    "target_fg"
    t.float    "size"
    t.integer  "yeast_id"
    t.integer  "minerals_id"
    t.integer  "grains_id"
    t.integer  "hops_id"
    t.integer  "mash_steps_id"
    t.float    "boil_time"
    t.float    "ibu"
    t.float    "abv"
    t.float    "srm"
    t.float    "pitch_temperature"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "recipes", ["grains_id"], :name => "index_recipes_on_grains_id"
  add_index "recipes", ["hops_id"], :name => "index_recipes_on_hops_id"
  add_index "recipes", ["mash_steps_id"], :name => "index_recipes_on_mash_steps_id"
  add_index "recipes", ["minerals_id"], :name => "index_recipes_on_minerals_id"
  add_index "recipes", ["style_id"], :name => "index_recipes_on_style_id"
  add_index "recipes", ["yeast_id"], :name => "index_recipes_on_yeast_id"

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

  create_table "yeasts", :force => true do |t|
    t.integer  "manufacturer_id"
    t.string   "name"
    t.string   "yeast_type"
    t.float    "efficiency"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "yeasts", ["manufacturer_id"], :name => "index_yeasts_on_manufacturer_id"

end
