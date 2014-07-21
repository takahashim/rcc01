class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.references :repo, index: true
      t.string :provider
      t.string :ref
      t.string :commit_id
      t.string :commit_timestamp
      t.text :message
      t.string :repository_name
      t.string :repository_url
      t.text :rawjson

      t.timestamps
    end
  end
end
