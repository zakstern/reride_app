class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :bikes, :year, :year_manufactured
  end
end
