class MakeController < ApplicationController

# GET /makes/new
  def new
    @make = Make.new
  end
  

private
	# Never trust parameters from the scary internet, only allow the white list through.
	def make_params
	  params.require(:make).permit(:name, models_attributes: [:name])
	end
end
