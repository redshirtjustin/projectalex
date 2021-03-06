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

ActiveRecord::Schema.define(version: 20141128033616) do

  create_table "atomchains", force: true do |t|
    t.integer  "story_id"
    t.integer  "atom_id"
    t.boolean  "active",     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "atomchains", ["atom_id"], name: "index_atomchains_on_atom_id"
  add_index "atomchains", ["story_id"], name: "index_atomchains_on_story_id"

  create_table "atoms", force: true do |t|
    t.text     "content"
    t.text     "quote"
    t.string   "quoted_name"
    t.string   "quoted_title"
    t.string   "quoted_org"
    t.string   "img_url"
    t.string   "img_caption"
    t.string   "img_citation"
    t.string   "img_location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "citations", force: true do |t|
    t.integer  "atom_id"
    t.string   "citation_url"
    t.string   "citation_source"
    t.string   "citation_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pipelines", force: true do |t|
    t.string   "pip_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "priorities", force: true do |t|
    t.string   "pri_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.string   "sec_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.string   "headline"
    t.text     "leadline"
    t.string   "shortline"
    t.string   "mast_url"
    t.string   "thumb_url"
    t.integer  "section_id"
    t.integer  "priority_id"
    t.integer  "pipeline_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["pipeline_id"], name: "index_stories_on_pipeline_id"
  add_index "stories", ["priority_id"], name: "index_stories_on_priority_id"
  add_index "stories", ["section_id"], name: "index_stories_on_section_id"

  create_table "taggings", force: true do |t|
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

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

end
