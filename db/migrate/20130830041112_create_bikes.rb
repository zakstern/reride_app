class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.date :year
      t.string :make
      t.string :model
      t.string :kind
      t.float :msrp
      t.float :current_price

      t.timestamps
    end
  end
end
