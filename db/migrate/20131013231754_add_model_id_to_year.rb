class AddModelIdToYear < ActiveRecord::Migration
  def change
  	add_column :years, :model_id, :integer
  end
end
