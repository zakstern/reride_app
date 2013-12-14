class AddConfirmationFieldsToInspections < ActiveRecord::Migration
  def change
  	add_column :inspections, :make_confirmation, :int
  	add_column :inspections, :model_confirmation, :int
  	add_column :inspections, :year_confirmation, :int
  	add_column :inspections, :frame_size, :int
  	add_column :inspections, :serial_number, :string
  	add_column :inspections, :front_picture_confirmation, :int
  	add_column :inspections, :side_picture_confirmation, :int
  end
end
