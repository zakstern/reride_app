class AddGoodValueToBikes < ActiveRecord::Migration
  def change
  	add_column :bikes, :good_value, :decimal, :precision => 8, :scale => 2
  end
end
