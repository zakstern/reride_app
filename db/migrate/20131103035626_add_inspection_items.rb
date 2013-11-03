class AddInspectionItems < ActiveRecord::Migration
  def change
  	add_column :inspections, :front_derailleur_status, :int
  	add_column :inspections, :rear_derailleur_status, :int
  	add_column :inspections, :front_wheel_status, :int
  	add_column :inspections, :rear_wheel_status, :int
  	add_column :inspections, :front_brake_status, :int
  	add_column :inspections, :rear_brake_status, :int
  	add_column :inspections, :seat_status, :int
  	add_column :inspections, :handlebar_tape_status, :int
  	add_column :inspections, :shifter_status, :int
  	add_column :inspections, :rear_cassette_status, :int
  	add_column :inspections, :chain_status, :int
  	add_column :inspections, :front_chainring_status, :int
  	add_column :inspections, :front_tire_stats, :int
  	add_column :inspections, :rear_tire_status, :int
  	add_column :inspections, :front_tube_status, :int
  	add_column :inspections, :rear_tube_status, :int
  	add_column :inspections, :frame_status, :int
  	add_column :inspections, :additional_info, :text
  end
end
