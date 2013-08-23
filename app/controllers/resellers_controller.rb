class ResellersController < ApplicationController
  before_action :set_reseller, only: [:show, :edit, :update, :destroy]

  # GET /resellers
  # GET /resellers.json
  def index
    @resellers = Reseller.all
  end

  # GET /resellers/1
  # GET /resellers/1.json
  def show
  end

  # GET /resellers/new
  def new
    @reseller = Reseller.new
    user = @reseller.users.build
  end

  # GET /resellers/1/edit
  def edit
  end

  # POST /resellers
  # POST /resellers.json
  def create
    @reseller = Reseller.new(reseller_params)

    respond_to do |format|
      if @reseller.save
        format.html { redirect_to @reseller, notice: 'Reseller was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reseller }
      else
        format.html { render action: 'new' }
        format.json { render json: @reseller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resellers/1
  # PATCH/PUT /resellers/1.json
  def update
    respond_to do |format|
      if @reseller.update(reseller_params)
        format.html { redirect_to @reseller, notice: 'Reseller was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reseller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resellers/1
  # DELETE /resellers/1.json
  def destroy
    @reseller.destroy
    respond_to do |format|
      format.html { redirect_to resellers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reseller
      @reseller = Reseller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reseller_params
      params.require(:reseller).permit(:name, :city, :state, :zip_code, :street_address, :phone_number, :website, 
        users_attributes: [:first_name, :last_name, :email, :password, :password_confirmation, :profile])
    end
end
