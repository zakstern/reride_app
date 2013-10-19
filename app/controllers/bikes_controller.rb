class BikesController < ApplicationController
  before_action :set_bike, only: [:show, :edit, :update, :destroy]


  # GET /bikes
  # GET /bikes.json
  def index
    @bikes = Bike.paginate(page: params[:page])
  end

  # GET /bikes/1
  # GET /bikes/1.json
  def show
  end

  # GET /bikes/new
  def new
    @bike = Bike.new
  end

  # GET /bikes/1/edit
  def edit
  end

  # POST /bikes
  # POST /bikes.json
  def create
    @bike = Bike.new(bike_params)
    respond_to do |format|
      if @bike.save
        format.html { redirect_to @bike, notice: 'Bike was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bike }
      else
        format.html { render action: 'new' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bikes/1
  # PATCH/PUT /bikes/1.json
  def update
    respond_to do |format|
      if @bike.update(bike_params)
        format.html { redirect_to @bike, notice: 'Bike was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bike.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bikes/1
  # DELETE /bikes/1.json
  def destroy
    @bike.destroy
    respond_to do |format|
      format.html { redirect_to bikes_url }
      format.json { head :no_content }
    end
  end

  def update_model_select
    models = Model.where(:make_id=>params[:id]).order(:name) unless params[:id].blank?
    render :partial => "shared/model_questions_fields", :locals => { :current_models => models }
  end

  def update_year_select
    model = Model.find(params[:id])
    render :partial => "shared/year_questions_fields", :locals => { :current_years => model.years }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_params
      params.require(:bike).permit(:year_id, :make, :make_id, :model, :model_id, :kind, :msrp, :current_price, :customer_id)
    end
end
