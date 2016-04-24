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

ActiveRecord::Schema.define(version: 20160424094954) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "images", force: :cascade do |t|
    t.string   "url_file_name"
    t.string   "url_content_type"
    t.integer  "url_file_size"
    t.datetime "url_updated_at"
    t.integer  "simple_block_id"
  end

  create_table "links", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.integer  "simple_block_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string  "name"
    t.string  "url"
    t.integer "position"
    t.integer "website_id"
    t.integer "page_id"
  end

  create_table "opera_translations", force: :cascade do |t|
    t.integer  "opera_id",   null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

  add_index "opera_translations", ["locale"], name: "index_opera_translations_on_locale"
  add_index "opera_translations", ["opera_id"], name: "index_opera_translations_on_opera_id"

  create_table "operas", force: :cascade do |t|
    t.text     "name"
    t.date     "year"
    t.integer  "archive_index"
    t.integer  "website_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.text     "description"
    t.text     "tecnical"
    t.text     "size"
    t.integer  "surface_id"
    t.integer  "subject_id"
    t.boolean  "circa_date"
    t.boolean  "cover_slider"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "shopping_cart_id"
    t.string  "ip"
    t.string  "express_token"
    t.string  "express_payer_id"
    t.date    "purchased_at"
    t.string  "address"
    t.string  "details"
    t.string  "email"
    t.string  "info"
    t.string  "name"
    t.string  "note"
    t.string  "payer_country"
    t.string  "shipping"
  end

  create_table "page_translations", force: :cascade do |t|
    t.integer  "page_id",    null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "content"
    t.string   "slug"
  end

  add_index "page_translations", ["locale"], name: "index_page_translations_on_locale"
  add_index "page_translations", ["page_id"], name: "index_page_translations_on_page_id"

  create_table "pages", force: :cascade do |t|
    t.integer "website_id"
  end

  create_table "products", force: :cascade do |t|
    t.text     "name"
    t.integer  "website_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "description"
    t.string   "price_label"
    t.boolean  "first_page"
    t.integer  "price_cents",        default: 0,     null: false
    t.string   "price_currency",     default: "EUR", null: false
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_block_translations", force: :cascade do |t|
    t.integer  "simple_block_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "title"
    t.text     "content"
    t.text     "action"
  end

  add_index "simple_block_translations", ["locale"], name: "index_simple_block_translations_on_locale"
  add_index "simple_block_translations", ["simple_block_id"], name: "index_simple_block_translations_on_simple_block_id"

  create_table "simple_blocks", force: :cascade do |t|
    t.integer  "page_id"
    t.string   "background_image_file_name"
    t.string   "background_image_content_type"
    t.integer  "background_image_file_size"
    t.datetime "background_image_updated_at"
    t.text     "title"
    t.text     "content"
    t.text     "action"
    t.boolean  "full_height"
    t.boolean  "background_color"
    t.string   "custom_type"
    t.boolean  "colors_inverted"
    t.integer  "position"
    t.text     "menu_title"
    t.boolean  "sliding"
    t.boolean  "container_fluid"
    t.integer  "num_elements"
    t.integer  "padding"
    t.text     "quality"
  end

  add_index "simple_blocks", ["page_id"], name: "index_simple_blocks_on_page_id"

  create_table "subject_translations", force: :cascade do |t|
    t.integer  "subject_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "subject_translations", ["locale"], name: "index_subject_translations_on_locale"
  add_index "subject_translations", ["subject_id"], name: "index_subject_translations_on_subject_id"

  create_table "subjects", force: :cascade do |t|
    t.text "name"
  end

  create_table "surface_translations", force: :cascade do |t|
    t.integer  "surface_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "surface_translations", ["locale"], name: "index_surface_translations_on_locale"
  add_index "surface_translations", ["surface_id"], name: "index_surface_translations_on_surface_id"

  create_table "surfaces", force: :cascade do |t|
    t.text "name"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "templates", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_websites", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "website_id", null: false
  end

  add_index "users_websites", ["user_id", "website_id"], name: "index_users_websites_on_user_id_and_website_id"
  add_index "users_websites", ["website_id", "user_id"], name: "index_users_websites_on_website_id_and_user_id"

  create_table "websites", force: :cascade do |t|
    t.string   "name"
    t.string   "name_slug"
    t.string   "primary_color"
    t.string   "secondary_color"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "first_page_id"
    t.string   "domain"
    t.integer  "template_id"
    t.boolean  "product"
    t.boolean  "opera"
    t.text     "css"
    t.text     "js"
    t.text     "head"
    t.boolean  "button_open_menu"
  end

  add_index "websites", ["user_id"], name: "index_websites_on_user_id"

end
