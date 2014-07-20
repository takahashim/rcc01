class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :ref
      t.string :commit_id
      t.string :commit_timestamp
      t.string :message
      t.string :repository_name
      t.string :repository_url
      t.text   :rawjson

      t.timestamps
    end
  end
end
