class AddBikeInfoToBikes < ActiveRecord::Migration
  def change
  	add_column :bikes, :make_id, :integer
  	add_column :bikes, :model_id, :integer
  	add_column :bikes, :year_id, :integer
  	add_column :bikes, :quote_value, :decimal, :precision => 8, :scale => 2
  end
end
