class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.integer :year_value

      t.timestamps
    end
  end
end
