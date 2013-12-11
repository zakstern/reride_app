class AddPaypalEmail < ActiveRecord::Migration
  def change
  	add_column :customers, :paypal_email, :string
  	add_column :customers, :password_digest, :string
  end
end
