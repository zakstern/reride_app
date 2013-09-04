class AddMakeTypeAndModelType < ActiveRecord::Migration
  def change
  	add_column :bikes, :make_id, :integer
  	add_column :bikes, :model_id, :integer
  end
end
