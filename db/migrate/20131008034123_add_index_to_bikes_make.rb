class AddIndexToBikesMake < ActiveRecord::Migration
  def change
  	add_index :bikes, :make
  	add_index :bikes, :model
  end
end
