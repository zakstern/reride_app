class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :bike_id
      t.integer :customer_id

      t.timestamps
    end

    add_index :quotes, :bike_id
    add_index :quotes, :customer_id
  end
end
