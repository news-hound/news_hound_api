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

ActiveRecord::Schema.define(version: 20161211190257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "url",        null: false
    t.integer  "lens_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lens_id"], name: "index_articles_on_lens_id", using: :btree
  end

  create_table "blacklists", force: :cascade do |t|
    t.integer  "domain_id",   null: false
    t.integer  "lens_id",     null: false
    t.string   "message",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "rebuttal_id"
    t.index ["domain_id", "lens_id"], name: "index_blacklists_on_domain_id_and_lens_id", unique: true, using: :btree
    t.index ["domain_id"], name: "index_blacklists_on_domain_id", using: :btree
    t.index ["lens_id"], name: "index_blacklists_on_lens_id", using: :btree
    t.index ["rebuttal_id"], name: "index_blacklists_on_rebuttal_id", using: :btree
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "keywords",    default: [], null: false, array: true
    t.string   "message",                  null: false
    t.integer  "lens_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "rebuttal_id"
    t.index ["rebuttal_id"], name: "index_concepts_on_rebuttal_id", using: :btree
  end

  create_table "domains", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_domains_on_name", unique: true, using: :btree
  end

  create_table "lenses", force: :cascade do |t|
    t.string   "name",            null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "session_token",   null: false
    t.string   "password_digest", null: false
    t.index ["name"], name: "index_lenses_on_name", unique: true, using: :btree
    t.index ["password_digest"], name: "index_lenses_on_password_digest", using: :btree
    t.index ["session_token"], name: "index_lenses_on_session_token", unique: true, using: :btree
  end

end
