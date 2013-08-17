class ProfileRelationshipToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.references :profile, :polymorphic => true
	end
  end
end
