class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :string
      t.string :last_name
      t.string :email
      t.references :profile, polymorphic: true

      t.timestamps
    end
  end
end
