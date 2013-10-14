class ModelController < ApplicationController
# GET /models/new
  def new
    @model = @make.models.new
  end

  

end
