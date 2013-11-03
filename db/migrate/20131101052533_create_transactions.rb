class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :customer_id
      t.integer :bike_shop_id
      t.string :status

      t.timestamps
    end
  end
end
