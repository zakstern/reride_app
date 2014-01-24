class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    if current_customer?(@customer)
      render
    else
      redirect_to root_url
    end
  end

  def new
    @customer = Customer.new
    @quote = @customer.quotes.build
    @bike = Bike.find(params[:bike_id])
  end

  def create
    @customer = Customer.new(customer_params) 
    if @customer.save
      sign_in @customer
      CustomerMailer.quote_confirmation(@customer).deliver
      flash[:success] = "Information Saved!"
      redirect_to @customer
    else
      if @customer.errors.any? 
        @customer.errors.full_messages.each do |msg|
          flash[:error] = msg
        end 
      end
      #render 'new', :bike => Bike.find(33003)
    end
  end

  def update
    if @customeer.update_attributes(customer_params)
      flash[:success] = "Profile updated"
      sign_in @customer
      redirect_to @customer
    else
      render 'edit'
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end

  private

   # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit!
      #params.require(:customer).permit(quotes_attributes: [:id, :side_picture, :front_picture]), :first_name, :last_name, :email, :street_address, :city, :state, :zip_code, :phone_number, :type)
    end
end
