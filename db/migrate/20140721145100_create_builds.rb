class CreateBuilds < ActiveRecord::Migration
  def change
    create_table :builds do |t|
      t.references :commit, index: true
      t.text :buildlog
      t.timestamp :started_at
      t.timestamp :finished_at

      t.timestamps
    end
  end
end
