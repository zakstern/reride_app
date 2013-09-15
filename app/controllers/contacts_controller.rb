class ContactsController < ApplicationController
	before_action :set_contact, only: [:show, :edit, :update, :destroy]
  
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)    
    if @contact.save
      flash[:success] = "Thank you for signing up...stay tuned!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private

   # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:email, :potential_relationship)
    end
end
