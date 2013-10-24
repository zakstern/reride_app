class AddValuesToBikeModel < ActiveRecord::Migration
  def change
  	add_column :bikes, :like_new_value, :decimal, :precision => 8, :scale => 2
  	add_column :bikes, :excellent_value, :decimal, :precision => 8, :scale => 2
  	add_column :bikes, :fair_value, :decimal, :precision => 8, :scale => 2
  end
end
