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

ActiveRecord::Schema.define(:version => 20120209133041) do

  create_table "categories", :force => true do |t|
    t.text     "descripcion"
    t.integer  "categoria_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "evento_detalles", :force => true do |t|
    t.text     "Descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "eventos", :force => true do |t|
    t.text     "descripcion"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.integer   "iscumple",                                     :null => false
  end

  create_table "forma_entregas", :force => true do |t|
    t.string   "descripcion", :limit => 50
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "imagen_pedidos", :force => true do |t|
    t.integer  "pedido_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "pedidodetalles", :force => true do |t|
    t.integer  "pedido_id"
    t.integer  "producto_id"
    t.integer  "cantidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pedidos", :force => true do |t|
    t.integer "forma_entrega_id"
    t.integer "sitio_entrega_id"
    t.integer "evento_id"
    t.date    "fechaevento"
    t.string  "nombre",             :limit => 50
    t.date    "fechacumple"
    t.integer "aniosacumplir"
    t.string  "tematica",           :limit => 50
    t.string  "colores",            :limit => 50
    t.string  "nombrecontacto",     :limit => 50
    t.string  "telefonoparticular", :limit => 50
    t.string  "celular",            :limit => 50
    t.string  "telalternativo",     :limit => 50
    t.string  "email1",             :limit => 50
    t.string  "email2",             :limit => 50
    t.date    "fechaentrega"
    t.time    "horarioentrega"
    t.integer "user_id"
    t.date    "fechacarga"
    t.string  "domicilio",          :limit => 150
    t.string  "entrecalles",        :limit => 50
    t.string  "barrio",             :limit => 50
    t.string  "codpos",             :limit => 11
    t.string  "localidad",          :limit => 50
    t.string  "provincia",          :limit => 50
    t.integer "status"
  end

  add_index "pedidos", ["user_id"], :name => "user_id"

  create_table "productos", :force => true do |t|
    t.text     "descripcion"
    t.integer  "categoria_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sitio_entregas", :force => true do |t|
    t.integer "forma_entrega_id"
    t.string  "descripcion",      :limit => 150
    t.string  "Detalle",          :limit => 250
  end

  add_index "sitio_entregas", ["forma_entrega_id"], :name => "forma_entrega_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
    t.string   "name"
    t.boolean  "isadmin",                               :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
