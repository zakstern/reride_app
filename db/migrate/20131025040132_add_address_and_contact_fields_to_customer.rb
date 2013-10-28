class AddAddressAndContactFieldsToCustomer < ActiveRecord::Migration
  def change
  	add_column :customers, :street_address, :string
  	add_column :customers, :city, :string
  	add_column :customers, :state, :string
  	add_column :customers, :zip_code, :string
  	add_column :customers, :phone_number, :string
  end
end
