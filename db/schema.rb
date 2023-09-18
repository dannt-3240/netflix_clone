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

ActiveRecord::Schema[7.0].define(version: 2023_08_25_095039) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "actors", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "castings", charset: "utf8mb3", force: :cascade do |t|
    t.string "castingable_type"
    t.bigint "castingable_id"
    t.bigint "actor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_castings_on_actor_id"
    t.index ["castingable_type", "castingable_id"], name: "index_castings_on_castingable"
  end

  create_table "countries", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "address"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "list_items", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "list_id"
    t.string "itemable_type"
    t.bigint "itemable_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itemable_type", "itemable_id"], name: "index_list_items_on_itemable"
    t.index ["list_id"], name: "index_list_items_on_list_id"
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

  create_table "movie_countries", charset: "utf8mb3", force: :cascade do |t|
    t.string "countryable_type"
    t.bigint "countryable_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_movie_countries_on_country_id"
    t.index ["countryable_type", "countryable_id"], name: "index_movie_countries_on_countryable"
  end

  create_table "movie_directors", charset: "utf8mb3", force: :cascade do |t|
    t.string "directorable_type"
    t.bigint "directorable_id"
    t.bigint "director_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["director_id"], name: "index_movie_directors_on_director_id"
    t.index ["directorable_type", "directorable_id"], name: "index_movie_directors_on_directorable"
  end

  create_table "movie_genres", charset: "utf8mb3", force: :cascade do |t|
    t.string "genreable_type"
    t.bigint "genreable_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["genreable_type", "genreable_id"], name: "index_movie_genres_on_genreable"
  end

  create_table "movie_productions", charset: "utf8mb3", force: :cascade do |t|
    t.string "productionable_type"
    t.bigint "productionable_id"
    t.bigint "production_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["production_id"], name: "index_movie_productions_on_production_id"
    t.index ["productionable_type", "productionable_id"], name: "index_movie_productions_on_productionable"
  end

  create_table "movie_videos", charset: "utf8mb3", force: :cascade do |t|
    t.string "videoable_type"
    t.bigint "videoable_id"
    t.string "video_url"
    t.string "server_name", default: "vidstream"
    t.integer "server_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["videoable_type", "videoable_id"], name: "index_movie_videos_on_videoable"
  end

  create_table "movies", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "imdb"
    t.float "rating", default: 0.0
    t.integer "liked", default: 0
    t.integer "watched", default: 0
    t.integer "duration"
    t.integer "release_year"
    t.integer "rank", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.string "content"
    t.timestamp "send_time"
    t.boolean "readed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "productions", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", charset: "utf8mb3", force: :cascade do |t|
    t.string "ratingable_type"
    t.bigint "ratingable_id"
    t.bigint "user_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ratingable_type", "ratingable_id"], name: "index_ratings_on_ratingable"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", charset: "utf8mb3", force: :cascade do |t|
    t.string "reviewable_type"
    t.bigint "reviewable_id"
    t.bigint "user_id"
    t.string "title"
    t.string "text"
    t.date "post_date"
    t.integer "liked", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tv_episodes", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "tv_serie_id"
    t.string "name"
    t.integer "order", default: 0
    t.date "release_date"
    t.string "tv_season_title"
    t.integer "tv_seasion_order", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tv_serie_id"], name: "index_tv_episodes_on_tv_serie_id"
  end

  create_table "tv_series", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "imdb"
    t.float "rating", default: 0.0
    t.integer "liked", default: 0
    t.integer "watched", default: 0
    t.integer "duration"
    t.integer "release_year"
    t.integer "rank", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_movie_watchlists", charset: "utf8mb3", force: :cascade do |t|
    t.string "watchlistable_type"
    t.bigint "watchlistable_id"
    t.bigint "user_id"
    t.integer "duration_watch"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_movie_watchlists_on_user_id"
    t.index ["watchlistable_type", "watchlistable_id"], name: "index_user_movie_watchlists_on_watchlistable"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.integer "rank", default: 0
    t.integer "coins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
