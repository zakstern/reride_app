class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :decline_offer, :accept_offer]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all 
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    @transaction.build_inspection
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.buyback_cost = get_buyback_cost(@transaction)
    respond_to do |format|
      if @transaction.save
        CustomerMailer.inspection_confirmation(@transaction).deliver
        format.js
      else
        format.html { render action: 'new' }
        format.js
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  def confirm
    
  end

  def decline_offer
    @transaction.status = "Declined"
    @transaction.save
    respond_to do |format|
      flash[:success] = "Offer was successfully declined."
      format.html { redirect_to @transaction }
    end
  end

  def accept_offer
    @transaction.status = "Accepted"
    @transaction.customer.paypal_email = @transaction.customer.email
    @transaction.save
    respond_to do |format|
      flash[:success] = "Offer was successfully accepted."
      format.html { redirect_to @transaction }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit!
    end

    # Returns the full title on a per-page basis.
  def get_buyback_cost(transaction)
    @inspection = transaction.inspection
    inspection_value = calculate_inspection_value(@inspection)
    buyback_cost = 0
    if inspection_value > 1.5
      puts transaction.quote.bike.good_value
      buyback_cost = transaction.quote.bike.good_value
    else
      buyback_cost = transaction.quote.bike.fair_value
      puts transaction.quote.bike.fair_value
    end
    puts buyback_cost
    buyback_cost*0.6
  end

  def calculate_inspection_value(inspection)
    total_inspection_value = 0
    count = 0
    inspection.attributes.each_pair do |name, value|
      if value.is_a? Integer
        total_inspection_value = total_inspection_value + value
        count = count + 1
      end
    end 
    puts total_inspection_value
    puts count
    inspection_value = total_inspection_value/count
    inspection_value
  end
end

