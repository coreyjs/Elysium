# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_03_163552) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "narrative_property_fields", force: :cascade do |t|
    t.string "name"
    t.string "export_name"
    t.integer "property_type", default: 0
    t.jsonb "value"
    t.string "dynamic_model_type"
    t.bigint "dynamic_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dynamic_model_type", "dynamic_model_id"], name: "index_narrative_property_fields_on_dynamic_model"
  end

  create_table "narrative_roots", force: :cascade do |t|
    t.string "title"
    t.bigint "narrative_series_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["narrative_series_id"], name: "index_narrative_roots_on_narrative_series_id"
  end

  create_table "narrative_series", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "export_name"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_narrative_series_on_project_id"
  end

  create_table "narrative_step_types", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_narrative_step_types_on_code", unique: true
  end

  create_table "narrative_steps", force: :cascade do |t|
    t.bigint "narrative_root_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["narrative_root_id"], name: "index_narrative_steps_on_narrative_root_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.boolean "deleted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "narrative_roots", "narrative_series"
  add_foreign_key "narrative_series", "projects"
  add_foreign_key "narrative_steps", "narrative_roots"
end
