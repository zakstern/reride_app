class YearController < ApplicationController
	# GET /years/new
  def new
    @year = @model.years.new
  end
end
