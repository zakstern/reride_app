class RemoveBikeFields < ActiveRecord::Migration
  def change
  	remove_column :bikes, :year_manufactured, :date
  	remove_column :bikes, :make, :string
  	remove_column :bikes, :model, :string
  	remove_column :bikes, :make_id, :integer
  	remove_column :bikes, :model_id, :integer
  end
end
