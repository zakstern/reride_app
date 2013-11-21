class AddBuybackPriceAndResalePriceToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :buyback_cost, :decimal, :precision => 8, :scale => 2
  	add_column :transactions, :resale_price, :decimal, :precision => 8, :scale => 2
  end
end
