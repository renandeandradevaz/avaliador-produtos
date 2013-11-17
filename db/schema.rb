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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131117155926) do

  create_table "categorias", force: true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notas", force: true do |t|
    t.decimal  "nota",       precision: 10, scale: 0
    t.integer  "produto_id",                          null: false
    t.integer  "user_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notas", ["produto_id"], name: "notas_produto_id_fk", using: :btree
  add_index "notas", ["user_id"], name: "notas_user_id_fk", using: :btree

  create_table "produtos", force: true do |t|
    t.string   "nome"
    t.string   "descricao"
    t.decimal  "nota_media",          precision: 10, scale: 0
    t.integer  "categoria_id",                                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  add_index "produtos", ["categoria_id"], name: "produtos_categoria_id_fk", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "notas", "produtos", name: "notas_produto_id_fk"
  add_foreign_key "notas", "users", name: "notas_user_id_fk"

  add_foreign_key "produtos", "categorias", name: "produtos_categoria_id_fk"

end
