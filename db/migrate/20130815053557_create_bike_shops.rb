class CreateBikeShops < ActiveRecord::Migration
  def change
    create_table :bike_shops do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :street_address
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
