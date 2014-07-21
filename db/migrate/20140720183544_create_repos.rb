class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :provider
      t.string :name
      t.string :branch
      t.references :user, index: true

      t.timestamps
    end
  end
end
