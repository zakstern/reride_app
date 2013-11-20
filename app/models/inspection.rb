class Inspection < ActiveRecord::Base
	belongs_to :transaction
	INSPECTION_VALUES = { "Excellent" => 3, "Good" => 2, "Bad" => 1, "Needs Repair" => 0 }
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

	INSPECTION_HASH = {
    	"front_derailleur_status" => { "Excellent" => 3, "Good" => 2, "Bad" => 1, "Needs Repair" => 0 },
    	"rear_derailleur_status" => { "Excellent" => 3, "Good" => 2, "Bad" => 1, "Needs Repair" => 0 },
    	"front_wheel_status" => { "True" => 3, "Partially True" => 2, "Not True" => 1, "Needs Repair" => 0 },
    	"rear_wheel_status" => { "True" => 3, "Partially True" => 2, "Not True" => 1, "Needs Repair" => 0 },
    	"front_brake_status" => { "Tight and Full Pad" => 3, "Partially Worn" => 2, "Very Worn" => 1, "Needs Repair" => 0 },
    	"rear_brake_status" => { "Tight and Full Pad" => 3, "Partially Worn" => 2, "Very Worn" => 1, "Needs Repair" => 00 },
    	"seat_status" => { "Excellent" => 3, "Minor Wear" => 2, "Torn" => 1, "Needs Repair" => 0 },
    	"handlebar_tape_status" => { "Excellent" => 3, "Partially Worn" => 2, "Ripped" => 1, "Needs Repair" => 0 },
    	"shifter_status" => { "Excellent" => 3, "Good" => 2, "Bad" => 1, "Needs Repair" => 0 },
    	"rear_cassette_status" => { "Little Use" => 3, "Moderate Use" => 2, "Heavy Use" => 1, "Needs Repair" => 0 },
    	"chain_status" => { "Excellent" => 3, "Good" => 2, "Bad" => 1, "Needs Repair" => 0 },
    	"front_chainring_status" => { "Little Use" => 3, "Moderate Use" => 2, "Heavy Use" => 1, "Needs Repair" => 0 },
    	"front_tire_status" => { "Excellent" => 3, "Slightly Worn" => 2, "Threads Visible" => 1, "Needs Repair" => 0 },
    	"rear_tire_status" => { "Excellent" => 3, "Slightly Worn" => 2, "Threads Visible" => 1, "Needs Repair" => 0 },
    	"front_tube_status" => { "Holds Air" => 1, "Replace" => 0 },
    	"rear_tube_status" => { "Holds Air" => 1, "Replace" => 0  },
    	"frame_status" => { "Excellent" => 3, "Minor Wear" => 2, "Major Wear" => 1, "Needs Repair" => 0 }
	}

end
