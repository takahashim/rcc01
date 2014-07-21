class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.references :repo, index: true
      t.string :provider
      t.string :ref
      t.string :after
      t.string :before
      t.string :compare
      t.string :commit_id
      t.string :commit_url
      t.string :commit_timestamp
      t.string :commit_author_name
      t.string :commit_author_username
      t.string :commit_committer_name
      t.string :commit_committer_username
      t.text   :commit_message
      t.string :repository_name
      t.string :repository_url
      t.string :repository_description
      t.string :repository_owner_name
      t.string :repository_private
      t.string :repository_master_branch
      t.text   :rawjson

      t.timestamps
    end
  end
end
