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

ActiveRecord::Schema.define(version: 2021_01_20_221002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "cards", force: :cascade do |t|
    t.string "title"
    t.integer "position"
    t.text "description"
    t.date "dateCreate"
    t.date "dateFinish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "column_id"
    t.index ["column_id"], name: "index_cards_on_column_id"
  end

  create_table "check_items", force: :cascade do |t|
    t.string "text"
    t.boolean "checked"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "card_id"
    t.index ["card_id"], name: "index_check_items_on_card_id"
  end

  create_table "columns", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "board_id"
    t.index ["board_id"], name: "index_columns_on_board_id"
  end

end
