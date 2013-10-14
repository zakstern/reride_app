class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.integer :model_id
      t.integer :year_id

      t.timestamps
    end
    add_index :versions, :model_id
    add_index :versions, :year_id
  end
end
