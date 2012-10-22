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

ActiveRecord::Schema.define(:version => 20121022204323) do

  create_table "arcane_schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "character_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spell_attributes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spell_levels", :force => true do |t|
    t.integer  "level"
    t.integer  "spell_id"
    t.integer  "character_class_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "spell_levels", ["character_class_id"], :name => "index_spell_levels_on_character_class_id"
  add_index "spell_levels", ["spell_id"], :name => "index_spell_levels_on_spell_id"

  create_table "spells", :force => true do |t|
    t.string   "name"
    t.integer  "arcane_school_id"
    t.string   "casting_time"
    t.boolean  "verbal"
    t.boolean  "somatic"
    t.string   "material"
    t.string   "focus"
    t.string   "range"
    t.string   "area"
    t.string   "effect"
    t.string   "targets"
    t.string   "duration"
    t.boolean  "dismissible"
    t.boolean  "shapeable"
    t.string   "saving_throw"
    t.boolean  "spell_resistance"
    t.text     "description"
    t.text     "formatted_description"
    t.integer  "source_id"
    t.boolean  "divine_focus"
    t.text     "short_description"
    t.integer  "deity_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "spells", ["arcane_school_id"], :name => "index_spells_on_arcane_school_id"
  add_index "spells", ["deity_id"], :name => "index_spells_on_deity_id"
  add_index "spells", ["source_id"], :name => "index_spells_on_source_id"

  create_table "spells_domains", :id => false, :force => true do |t|
    t.integer "spell_id"
    t.integer "domain_id"
  end

  create_table "spells_spell_attributes", :id => false, :force => true do |t|
    t.integer "spell_id"
    t.integer "spell_attribute_id"
  end

  create_table "spells_subschools", :id => false, :force => true do |t|
    t.integer "spell_id"
    t.integer "subschool_id"
  end

  create_table "subschools", :force => true do |t|
    t.string   "name"
    t.integer  "arcane_school_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "subschools", ["arcane_school_id"], :name => "index_subschools_on_arcane_school_id"

end
