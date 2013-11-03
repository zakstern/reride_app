class ChangeFrontTireColumn < ActiveRecord::Migration
  def change
  	rename_column :inspections, :front_tire_stats, :front_tire_status
  end
end
