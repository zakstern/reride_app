class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)    # Not the final implementation!
    if @customer.save
      flash[:success] = "Thank you for signing up...stay tuned!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email,
                                   :type)
    end
end
