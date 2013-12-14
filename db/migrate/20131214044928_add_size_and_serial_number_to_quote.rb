class AddSizeAndSerialNumberToQuote < ActiveRecord::Migration
  def change
  	add_column :quotes, :size, :int
  	add_column :quotes, :serial_number, :string
  	add_index :quotes, :serial_number
  end
end
