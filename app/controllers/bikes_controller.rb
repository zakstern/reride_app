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
    puts "in /bikes/show"
    @customer = Customer.new
    @quote = @customer.quotes.build
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

  def search
    bike = Bike.find_by(:make_id => params[:bike][:make_id], :model_id => params[:bike][:model_id], :year_id => params[:bike][:year_value])
    redirect_to :action => "show", :id => bike.id
  end

  def update_model_select
    puts "made it here"
    if params[:id] == '0'
      models = []
    else
      models = Make.find(params[:id]).models
    end
    render :partial => "shared/model_questions_fields", :locals => { :current_models => models }
  end

  def update_year_select
    if params[:id] == '0'
      years = []
    else
      years = Model.find(params[:id]).years
    end
    render :partial => "shared/year_questions_fields", :locals => { :current_years => years }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bike
      @bike = Bike.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bike_params
      params.require(:bike).permit(:year_id, :make, :make_id, :model, :model_id, :kind, 
        :msrp, :current_price, :customer_id, :side_picture, :like_new_value, :excellent_value, :good_value,
        :fair_value)
    end
end
