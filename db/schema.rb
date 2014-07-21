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

ActiveRecord::Schema.define(version: 20140721145100) do

  create_table "builds", force: true do |t|
    t.integer  "commit_id"
    t.text     "log"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "builds", ["commit_id"], name: "index_builds_on_commit_id", using: :btree

  create_table "commits", force: true do |t|
    t.integer  "repo_id"
    t.string   "provider"
    t.string   "ref"
    t.string   "after"
    t.string   "before"
    t.string   "compare"
    t.string   "commit_id"
    t.string   "commit_url"
    t.string   "commit_timestamp"
    t.string   "commit_author_name"
    t.string   "commit_author_username"
    t.string   "commit_committer_name"
    t.string   "commit_committer_username"
    t.text     "commit_message"
    t.string   "repository_name"
    t.string   "repository_url"
    t.string   "repository_description"
    t.string   "repository_owner_name"
    t.string   "repository_private"
    t.string   "repository_master_branch"
    t.text     "rawjson"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commits", ["repo_id"], name: "index_commits_on_repo_id", using: :btree

  create_table "repos", force: true do |t|
    t.string   "provider"
    t.string   "name"
    t.string   "branch"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "repos", ["user_id"], name: "index_repos_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider",      null: false
    t.string   "uid",           null: false
    t.string   "nickname",      null: false
    t.string   "image_url",     null: false
    t.string   "dropbox_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree

end
