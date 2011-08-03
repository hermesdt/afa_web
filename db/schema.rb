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

ActiveRecord::Schema.define(:version => 20110802185829) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "field_values", :force => true do |t|
    t.string   "value"
    t.integer  "template_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin_tags", :force => true do |t|
    t.integer  "plugin_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plugin_tags", ["plugin_id", "tag_id"], :name => "index_plugin_tags_on_plugin_id_and_tag_id", :unique => true

  create_table "plugins", :force => true do |t|
    t.string   "name"
    t.string   "os"
    t.integer  "category_id"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "posts", :force => true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_template_fields", :force => true do |t|
    t.integer  "technique_template_id"
    t.integer  "template_field_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "field_value_id"
  end

  create_table "technique_templates", :force => true do |t|
    t.integer  "technique_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technique_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "techniques", :force => true do |t|
    t.string   "filename"
    t.string   "location"
    t.integer  "technique_type_id", :default => 1
    t.integer  "plugin_id"
    t.boolean  "recursively",       :default => false
    t.string   "hash_type"
    t.string   "hash_value"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mimetype"
  end

  create_table "template_fields", :force => true do |t|
    t.string   "name"
    t.string   "tech_col_name"
    t.integer  "field_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
