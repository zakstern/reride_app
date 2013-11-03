class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :transaction_id

      t.timestamps
    end
  end
end
