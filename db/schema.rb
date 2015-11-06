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

ActiveRecord::Schema.define(version: 20151106203428) do

  create_table "food_preferences", force: :cascade do |t|
    t.string   "food_preference_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "food_types", force: :cascade do |t|
    t.string   "food_type_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "kitchens", force: :cascade do |t|
    t.string   "kitchen_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "recipe_name"
    t.integer  "amount_people"
    t.integer  "cooking_time"
    t.string   "difficulty_level"
    t.text     "ingredients"
    t.text     "step_by_step"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photograph_file_name"
    t.string   "photograph_content_type"
    t.integer  "photograph_file_size"
    t.datetime "photograph_updated_at"
    t.integer  "kitchen_id"
    t.integer  "food_type_id"
    t.integer  "food_preference_id"
  end

  add_index "recipes", ["food_preference_id"], name: "index_recipes_on_food_preference_id"
  add_index "recipes", ["food_type_id"], name: "index_recipes_on_food_type_id"
  add_index "recipes", ["kitchen_id"], name: "index_recipes_on_kitchen_id"

end
