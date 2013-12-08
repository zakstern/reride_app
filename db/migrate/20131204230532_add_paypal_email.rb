class AddPaypalEmail < ActiveRecord::Migration
  def change
  	add_column :customers, :paypal_email, :string
  end
end
