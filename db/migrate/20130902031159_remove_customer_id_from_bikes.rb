class RemoveCustomerIdFromBikes < ActiveRecord::Migration
  def change
    remove_column :bikes, :customer_id, :integer
  end
end
