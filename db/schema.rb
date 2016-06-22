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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_creations", id: :bigserial, force: :cascade do |t|
    t.integer  "collection_id", limit: 8, default: 0, null: false
    t.integer  "creation_id",   limit: 8, default: 0, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "collection_creations", ["collection_id"], name: "idx_collection_creations_collection_id", using: :btree
  add_index "collection_creations", ["creation_id"], name: "idx_collection_creations_creation_id", using: :btree

  create_table "collections", id: :bigserial, force: :cascade do |t|
    t.string   "sid",          limit: 32
    t.integer  "site_user_id", limit: 8,   default: 0, null: false
    t.string   "title",        limit: 200
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "collections", ["sid"], name: "idx_collections_sid", unique: true, using: :btree
  add_index "collections", ["site_user_id"], name: "idx_collections_site_user_id", using: :btree

  create_table "creation_comments", id: :bigserial, force: :cascade do |t|
    t.string   "sid",          limit: 32
    t.integer  "creation_id",  limit: 8,    default: 0, null: false
    t.integer  "site_user_id", limit: 8,    default: 0, null: false
    t.string   "body",         limit: 1000
    t.integer  "parent",       limit: 8
    t.string   "notice_code",  limit: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "creation_comments", ["creation_id"], name: "idx_creation_comments_creation_id", using: :btree
  add_index "creation_comments", ["sid"], name: "idx_creation_comments_sid", unique: true, using: :btree
  add_index "creation_comments", ["site_user_id"], name: "idx_creation_comments_site_user_id", using: :btree

  create_table "creation_images", id: :bigserial, force: :cascade do |t|
    t.integer  "creation_id",         limit: 8,    default: 0, null: false
    t.string   "image",               limit: 2083
    t.string   "image_name_for_user", limit: 256,              null: false
    t.integer  "order"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.datetime "removed_at"
    t.integer  "removed_id",          limit: 8,    default: 0
  end

  add_index "creation_images", ["creation_id"], name: "idx_creation_images_creation_id", using: :btree
  add_index "creation_images", ["removed_id"], name: "idx_creation_images_removed_id", using: :btree

  create_table "creation_pieces", id: :bigserial, force: :cascade do |t|
    t.integer  "creation_id",         limit: 8,    default: 0, null: false
    t.string   "name",                limit: 200
    t.string   "file",                limit: 2083,             null: false
    t.string   "file_name_for_user",  limit: 256
    t.string   "format",              limit: 10
    t.string   "image",               limit: 2083
    t.string   "image_name_for_user", limit: 256
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.datetime "removed_at"
    t.integer  "removed_id",          limit: 8,    default: 0
  end

  add_index "creation_pieces", ["creation_id"], name: "idx_creation_pieces_creation_id", using: :btree
  add_index "creation_pieces", ["removed_id"], name: "idx_creation_pieces_removed_id", using: :btree

  create_table "creation_statuses", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "creation_tags", id: :bigserial, force: :cascade do |t|
    t.integer  "creation_id", limit: 8, default: 0, null: false
    t.integer  "tag_id",      limit: 8, default: 0, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "removed_at"
    t.integer  "removed_id",  limit: 8, default: 0
  end

  add_index "creation_tags", ["creation_id", "tag_id"], name: "idx_creation_tags_creation_id_tag_id", unique: true, using: :btree
  add_index "creation_tags", ["creation_id"], name: "idx_creation_tags_creation_id", using: :btree
  add_index "creation_tags", ["removed_id"], name: "idx_creation_tags_removed_id", using: :btree
  add_index "creation_tags", ["tag_id"], name: "idx_creation_tags_tag_id", using: :btree

  create_table "creations", id: :bigserial, force: :cascade do |t|
    t.string   "sid",                limit: 32
    t.integer  "site_id",                          default: 0,  null: false
    t.integer  "site_user_id",       limit: 8,     default: 0,  null: false
    t.string   "title",              limit: 200,   default: ""
    t.string   "description",        limit: 10000, default: ""
    t.string   "license_code"
    t.integer  "creation_status_id",               default: 1
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "published_at"
  end

  add_index "creations", ["creation_status_id"], name: "idx_creations_creation_status_id", using: :btree
  add_index "creations", ["published_at"], name: "idx_creations_published_at", using: :btree
  add_index "creations", ["sid"], name: "idx_creations_sid", unique: true, using: :btree
  add_index "creations", ["site_id"], name: "idx_creations_site_id", using: :btree
  add_index "creations", ["site_user_id"], name: "idx_creations_site_user_id", using: :btree

  create_table "goods", id: :bigserial, force: :cascade do |t|
    t.integer  "creation_id",  limit: 8, default: 0, null: false
    t.integer  "site_user_id", limit: 8, default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.datetime "removed_at"
    t.integer  "removed_id",   limit: 8, default: 0
  end

  add_index "goods", ["creation_id"], name: "idx_goods_creation_id", using: :btree
  add_index "goods", ["removed_id"], name: "idx_goods_removed_id", using: :btree
  add_index "goods", ["site_user_id"], name: "idx_goods_site_user_id", using: :btree

  create_table "report_images", id: :bigserial, force: :cascade do |t|
    t.integer  "report_id",  limit: 8,    default: 0, null: false
    t.string   "image",      limit: 2083
    t.integer  "order"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "report_images", ["report_id"], name: "idx_report_images_report_id", using: :btree

  create_table "reports", id: :bigserial, force: :cascade do |t|
    t.integer  "creation_id",  limit: 8,     default: 0, null: false
    t.integer  "site_user_id", limit: 8,     default: 0, null: false
    t.string   "title",        limit: 200,               null: false
    t.string   "detail",       limit: 10000
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "reports", ["creation_id"], name: "idx_reports_creation_id", using: :btree
  add_index "reports", ["site_user_id"], name: "idx_reports_site_user_id", using: :btree

  create_table "site_user_header_images", id: :bigserial, force: :cascade do |t|
    t.integer  "site_user_id",        limit: 8,    default: 0, null: false
    t.string   "image",               limit: 2083
    t.string   "image_name_for_user", limit: 256
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "site_user_header_images", ["site_user_id"], name: "idx_site_user_header_images_site_user_id", using: :btree

  create_table "site_user_images", id: :bigserial, force: :cascade do |t|
    t.integer  "site_user_id",        limit: 8,    default: 0, null: false
    t.string   "image",               limit: 2083
    t.string   "image_name_for_user", limit: 256
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "site_user_images", ["site_user_id"], name: "idx_site_user_images_site_user_id", using: :btree

  create_table "site_user_statuses", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "site_user_tags", id: :bigserial, force: :cascade do |t|
    t.integer  "site_user_id", limit: 8, default: 0, null: false
    t.integer  "tag_id",       limit: 8, default: 0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "site_user_tags", ["site_user_id"], name: "idx_site_user_tags_site_user_id", using: :btree
  add_index "site_user_tags", ["tag_id"], name: "idx_site_user_tags_tag_id", using: :btree

  create_table "site_users", id: :bigserial, force: :cascade do |t|
    t.string   "sid",                 limit: 32
    t.integer  "site_id",                           default: 0, null: false
    t.integer  "user_id",             limit: 8,     default: 0, null: false
    t.string   "nickname",            limit: 100
    t.string   "biography",           limit: 10000
    t.boolean  "tos_accepted"
    t.integer  "site_user_status_id",               default: 0, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "site_users", ["sid"], name: "idx_site_users_sid", unique: true, using: :btree
  add_index "site_users", ["site_id", "user_id"], name: "idx_site_users_site_id_and_user_id", unique: true, using: :btree
  add_index "site_users", ["site_user_status_id"], name: "idx_site_users_site_user_status_id", using: :btree
  add_index "site_users", ["user_id"], name: "idx_site_users_user_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.string   "url",        limit: 256
    t.string   "access_key", limit: 36
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sites", ["access_key"], name: "idx_sites_access_key", unique: true, using: :btree

  create_table "tag_classes", force: :cascade do |t|
    t.string "name", limit: 20
  end

  create_table "tags", id: :bigserial, force: :cascade do |t|
    t.string   "name",         limit: 100
    t.integer  "tag_class_id",             default: 0, null: false
    t.integer  "site_id",                  default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tags", ["name", "site_id"], name: "idx_tags_name_site_id", unique: true, using: :btree
  add_index "tags", ["site_id"], name: "idx_tags_site_id", using: :btree
  add_index "tags", ["tag_class_id"], name: "idx_tags_tag_class_id", using: :btree

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "baas_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["baas_id"], name: "idx_users_baas_id", unique: true, using: :btree

  add_foreign_key "collection_creations", "collections", name: "fk_collection_creations_collections"
  add_foreign_key "collection_creations", "creations", name: "fk_collection_creations_creations"
  add_foreign_key "collections", "site_users", name: "fk_collections_site_users"
  add_foreign_key "creation_comments", "creation_comments", column: "parent", name: "fk_creation_comments_parent"
  add_foreign_key "creation_comments", "creations", name: "fk_creation_comments_creations"
  add_foreign_key "creation_comments", "site_users", name: "fk_creation_comments_site_user"
  add_foreign_key "creation_images", "creations", name: "fk_creation_images_creations"
  add_foreign_key "creation_pieces", "creations", name: "fk_creation_pieces_creations"
  add_foreign_key "creation_tags", "creations", name: "fk_creation_tags_creations"
  add_foreign_key "creation_tags", "tags", name: "fk_creation_tags_tags"
  add_foreign_key "creations", "creation_statuses", name: "fk_creations_creation_statuses"
  add_foreign_key "creations", "site_users", name: "fk_creations_site_users"
  add_foreign_key "creations", "sites", name: "fk_creations_sites"
  add_foreign_key "goods", "creations", name: "fk_goods_creations"
  add_foreign_key "goods", "site_users", name: "fk_goods_site_users"
  add_foreign_key "report_images", "reports", name: "fk_report_images_reports"
  add_foreign_key "reports", "creations", name: "fk_reports_creations"
  add_foreign_key "reports", "site_users", name: "fk_reports_site_users"
  add_foreign_key "site_user_header_images", "site_users", name: "fk_site_user_header_images_site_users"
  add_foreign_key "site_user_images", "site_users", name: "fk_site_user_images_site_users"
  add_foreign_key "site_user_tags", "site_users", name: "fk_site_user_tags_site_users"
  add_foreign_key "site_user_tags", "tags", name: "fk_site_user_tags_tags"
  add_foreign_key "site_users", "site_user_statuses", name: "fk_site_users_site_user_statuses"
  add_foreign_key "site_users", "sites", name: "fk_site_users_sites"
  add_foreign_key "site_users", "users", name: "fk_site_users_users"
  add_foreign_key "tags", "sites", name: "fk_tags_sites"
  add_foreign_key "tags", "tag_classes", name: "fk_tags_tag_classes"
end
