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

ActiveRecord::Schema.define(version: 20170910145050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assembly_relationships", force: :cascade do |t|
    t.bigint "assembly_id"
    t.bigint "sub_assembly_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assembly_id", "sub_assembly_id"], name: "index_assembly_relationships_on_assembly_id_and_sub_assembly_id", unique: true
    t.index ["assembly_id"], name: "index_assembly_relationships_on_assembly_id"
    t.index ["sub_assembly_id"], name: "index_assembly_relationships_on_sub_assembly_id"
  end

  add_foreign_key "assembly_relationships", "assemblies"
  add_foreign_key "assembly_relationships", "assemblies", column: "sub_assembly_id"
end
