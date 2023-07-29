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

ActiveRecord::Schema[7.0].define(version: 2023_07_29_080534) do
  create_table "actors", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castings", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_castings_on_actor_id"
    t.index ["movie_id"], name: "index_castings_on_movie_id"
  end

  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "user_id"
    t.string "title"
    t.integer "rating"
    t.string "text"
    t.date "post_date"
    t.integer "liked"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_comments_on_movie_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "movie_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_genres_on_movie_id"
  end

  create_table "list_items", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "list_id"
    t.bigint "movie_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_list_items_on_list_id"
    t.index ["movie_id"], name: "index_list_items_on_movie_id"
  end

  create_table "lists", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "description"
    t.string "image"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "movies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "imdb"
    t.float "rating"
    t.string "poster"
    t.integer "liked"
    t.integer "watched"
    t.integer "running_time"
    t.string "country"
    t.integer "release_year"
    t.string "video_url"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.timestamp "send_time"
    t.boolean "readed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "user_movie_watchlists", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "user_id"
    t.integer "duration_watch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_user_movie_watchlists_on_movie_id"
    t.index ["user_id"], name: "index_user_movie_watchlists_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.integer "rank"
    t.string "ip"
    t.boolean "locked"
    t.boolean "logged"
    t.date "lastlogin"
    t.integer "likes"
    t.integer "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
