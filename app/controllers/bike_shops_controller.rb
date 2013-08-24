class BikeShopsController < ApplicationController
  before_action :set_bike_shop, only: [:show, :edit, :update, :destroy]

  def index
    @bike_shops = BikeShop.all
  end

  def new
  	@bike_shop = BikeShop.new
    user = @bike_shop.users.build
  end

   # GET /resellers/1/edit
  def edit
  end

  def show
  end

  def create
    @bike_shop = BikeShop.new(bike_shop_params)
    if @bike_shop.save
      flash[:success] = "Your account was successfully created!"
      redirect_to @bike_shop
    else
      render 'new'
    end
  end

  # PATCH/PUT /resellers/1
  # PATCH/PUT /resellers/1.json
  def update
    respond_to do |format|
      if @bike_shop.update(bike_shop_params)
        format.html { redirect_to @bike_shop, notice: 'Bike Shop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bike_shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resellers/1
  # DELETE /resellers/1.json
  def destroy
    @bike_shop.destroy
    respond_to do |format|
      format.html { redirect_to bike_shops_url }
      format.json { head :no_content }
    end
  end

  private

     # Use callbacks to share common setup or constraints between actions.
    def set_bike_shop
      @bike_shop = BikeShop.find(params[:id])
    end

    def bike_shop_params
      params.require(:bike_shop).permit(:name, :street_address, :city, :state, :zip_code,
                                   :phone_number, :website, 
                                   users_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :profile])
    end
end
