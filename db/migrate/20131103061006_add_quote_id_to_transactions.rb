class AddQuoteIdToTransactions < ActiveRecord::Migration
  def change
  	add_column :transactions, :quote_id, :int
  end
end
