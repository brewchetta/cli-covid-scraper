# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_165157) do

  create_table "states", force: :cascade do |t|
    t.string "state_initials"
    t.integer "tested"
    t.integer "positive"
    t.integer "deaths"
    t.float "tested_per_million"
    t.float "positive_per_tested"
    t.float "deaths_per_positive"
    t.float "deaths_per_million"
    t.float "last_updated"
    t.integer "population"
    t.float "deaths_per_day_10_year_avg"
    t.string "date_recorded"
  end

end
