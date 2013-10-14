class RemoveModelAndYearIndex < ActiveRecord::Migration
  def change
  	remove_index :versions, [:model_id, :year_id]
  end
end
