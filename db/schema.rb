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

ActiveRecord::Schema.define(version: 20170910163154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assembly_parts", force: :cascade do |t|
    t.bigint "assembly_id", null: false
    t.bigint "part_id", null: false
    t.integer "part_quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_id", "part_id"], name: "index_assembly_parts_on_assembly_id_and_part_id", unique: true
    t.index ["assembly_id"], name: "index_assembly_parts_on_assembly_id"
    t.index ["part_id"], name: "index_assembly_parts_on_part_id"
  end

  create_table "assembly_relationships", force: :cascade do |t|
    t.bigint "assembly_id"
    t.bigint "sub_assembly_id"
    t.integer "sub_assembly_quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_id", "sub_assembly_id"], name: "index_assembly_relationships_on_assembly_id_and_sub_assembly_id", unique: true
    t.index ["assembly_id"], name: "index_assembly_relationships_on_assembly_id"
    t.index ["sub_assembly_id"], name: "index_assembly_relationships_on_sub_assembly_id"
  end

  create_table "id_tags", force: :cascade do |t|
    t.string "identifier", null: false
    t.string "id_taggable_type"
    t.bigint "id_taggable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_taggable_id", "id_taggable_type"], name: "index_id_tags_on_id_taggable_id_and_id_taggable_type"
    t.index ["id_taggable_type", "id_taggable_id"], name: "index_id_tags_on_id_taggable_type_and_id_taggable_id"
    t.index ["identifier"], name: "index_id_tags_on_identifier", unique: true
  end

  create_table "parts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "assembly_parts", "assemblies"
  add_foreign_key "assembly_parts", "parts"
  add_foreign_key "assembly_relationships", "assemblies"
  add_foreign_key "assembly_relationships", "assemblies", column: "sub_assembly_id"
end
