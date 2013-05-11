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

ActiveRecord::Schema.define(:version => 20130511201717) do

  create_table "capacitacion_usuarios", :force => true do |t|
    t.integer  "usuario_id"
    t.integer  "capacitacion_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "capacitacion_usuarios", ["capacitacion_id"], :name => "index_capacitacion_usuarios_on_capacitacion_id"
  add_index "capacitacion_usuarios", ["usuario_id"], :name => "index_capacitacion_usuarios_on_usuario_id"

  create_table "capacitacions", :force => true do |t|
    t.string   "tema"
    t.datetime "fecha"
    t.string   "institucion"
    t.text     "observaciones"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "capacitador_id"
    t.float    "valor_base"
    t.float    "valor_cat_a"
    t.float    "valor_cat_b"
    t.float    "valor_cat_c"
    t.float    "valor_cat_d"
    t.boolean  "cat_e"
    t.float    "valor_cat_e"
  end

  create_table "capacitadors", :force => true do |t|
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
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "tipo_identificacion"
    t.string   "identificacion"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "capacitadors", ["email"], :name => "index_capacitadors_on_email", :unique => true
  add_index "capacitadors", ["reset_password_token"], :name => "index_capacitadors_on_reset_password_token", :unique => true

  create_table "usuarios", :force => true do |t|
    t.string   "nombres"
    t.string   "apellidos"
    t.string   "tipo_identificacion"
    t.string   "identificacion"
    t.string   "telefono"
    t.string   "email"
    t.string   "categoria"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
