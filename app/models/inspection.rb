class Inspection < ActiveRecord::Base
	belongs_to :transaction
	INSPECTION_VALUES = { "Like-New" => 5, "Excellent" => 4, "Good" => 3, "Fair" => 2, "Poor" => 1 }
	INSPECTION_TYPES = [
		"front_derailleur_status", "rear_derailleur_status", 
		"front_wheel_status", "rear_wheel_status", 
		"front_brake_status", "rear_brake_status", 
		"seat_status", "handlebar_tape_status", 
		"shifter_status", "rear_cassette_status", 
		"chain_status", "front_chainring_status", 
		"front_tire_status", "rear_tire_status", 
		"front_tube_status", "rear_tube_status", 
		"frame_status"
	]

end
