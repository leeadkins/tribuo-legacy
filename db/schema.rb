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

ActiveRecord::Schema.define(:version => 20101102060609) do

  create_table "children", :force => true do |t|
    t.string   "name"
    t.integer  "age"
    t.integer  "agetype"
    t.integer  "family_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "phone"
    t.string   "address"
    t.string   "directions"
    t.integer  "familysize"
    t.integer  "childrensize"
    t.boolean  "foodonly"
    t.integer  "box"
    t.integer  "user_id"
    t.integer  "children_count"
    t.boolean  "pickup"
    t.boolean  "flag"
    t.datetime "completed_on"
    t.boolean  "reserve"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => ""
    t.string   "password_salt",                       :default => ""
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token",     :limit => 20
    t.datetime "invitation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
