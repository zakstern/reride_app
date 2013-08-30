class AddCustomerId < ActiveRecord::Migration
  def change
  	add_column :bikes, :customer_id, :integer
  end
end
