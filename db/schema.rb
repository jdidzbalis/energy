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

ActiveRecord::Schema.define(:version => 20130225152400) do

  create_table "admins", :force => true do |t|
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

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "project_fundings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "investment_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "state"
    t.integer  "funding_offered"
  end

  add_index "project_fundings", ["user_id", "investment_id", "state"], :name => "index_project_fundings_on_user_id_and_investment_id_and_state"

  create_table "project_returns", :force => true do |t|
    t.integer  "y1"
    t.integer  "y2"
    t.integer  "return_energysavings"
    t.integer  "return_energyprice"
    t.integer  "return_costsavings"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "project_name"
    t.integer  "project_cost"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.integer  "percent_funded"
    t.integer  "funded"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "project_owner"
    t.string   "project_location"
    t.date     "project_opdate"
    t.integer  "project_esavings"
    t.integer  "project_csavings"
    t.integer  "project_allocation"
    t.integer  "fundinglevel1"
    t.integer  "fundinglevel2"
    t.integer  "fundinglevel3"
    t.integer  "fundinglevel4"
    t.integer  "fundinglevel5"
    t.integer  "y1_savings"
    t.integer  "y2_savings"
    t.integer  "y3_savings"
    t.integer  "y4_savings"
    t.integer  "y5_savings"
    t.integer  "y6_savings"
    t.integer  "y7_savings"
    t.integer  "y8_savings"
    t.integer  "y9_savings"
    t.integer  "y10_savings"
    t.decimal  "y1_savings_per",      :precision => 4, :scale => 3
    t.string   "state"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
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
    t.integer  "user_id"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
