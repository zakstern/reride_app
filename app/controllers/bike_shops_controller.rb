class BikeShopsController < ApplicationController
  def new
  	@bike_shop = BikeShop.new
    @user = @bike_shop.build_user
  end

  def show
    @bike_shop = BikeShop.find(params[:id])
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

  private

    def bike_shop_params
      params.require(:bike_shop).permit(:name, :street_address, :city, :state, :zip_code,
                                   :phone_number, :website)
    end
end
