require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ResellersController do

  # This should return the minimal set of attributes required to create a valid
  # Reseller. As you add validations to Reseller, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {:name => "Reseller", :city => "Exampleville", :state => "CA", 
    :zip_code => "90405", :street_address => "100 Fake Street", :phone_number => "555-555-5555", :website => "http://www.fake.com" }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResellersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all resellers as @resellers" do
      reseller = Reseller.create! valid_attributes
      get :index, {}, valid_session
      assigns(:resellers).should eq([reseller])
    end
  end

  describe "GET show" do
    it "assigns the requested reseller as @reseller" do
      reseller = Reseller.create! valid_attributes
      get :show, {:id => reseller.to_param}, valid_session
      assigns(:reseller).should eq(reseller)
    end
  end

  describe "GET new" do
    it "assigns a new reseller as @reseller" do
      get :new, {}, valid_session
      assigns(:reseller).should be_a_new(Reseller)
    end
  end

  describe "GET edit" do
    it "assigns the requested reseller as @reseller" do
      reseller = Reseller.create! valid_attributes
      get :edit, {:id => reseller.to_param}, valid_session
      assigns(:reseller).should eq(reseller)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Reseller" do
        expect {
          post :create, {:reseller => valid_attributes}, valid_session
        }.to change(Reseller, :count).by(1)
      end

      it "assigns a newly created reseller as @reseller" do
        post :create, {:reseller => valid_attributes}, valid_session
        assigns(:reseller).should be_a(Reseller)
        assigns(:reseller).should be_persisted
      end

      it "redirects to the created reseller" do
        post :create, {:reseller => valid_attributes}, valid_session
        response.should redirect_to(Reseller.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved reseller as @reseller" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reseller.any_instance.stub(:save).and_return(false)
        post :create, {:reseller => { "name" => "invalid value" }}, valid_session
        assigns(:reseller).should be_a_new(Reseller)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Reseller.any_instance.stub(:save).and_return(false)
        post :create, {:reseller => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested reseller" do
        reseller = Reseller.create! valid_attributes
        # Assuming there are no other resellers in the database, this
        # specifies that the Reseller created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Reseller.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => reseller.to_param, :reseller => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested reseller as @reseller" do
        reseller = Reseller.create! valid_attributes
        put :update, {:id => reseller.to_param, :reseller => valid_attributes}, valid_session
        assigns(:reseller).should eq(reseller)
      end

      it "redirects to the reseller" do
        reseller = Reseller.create! valid_attributes
        put :update, {:id => reseller.to_param, :reseller => valid_attributes}, valid_session
        response.should redirect_to(reseller)
      end
    end

    describe "with invalid params" do
      it "assigns the reseller as @reseller" do
        reseller = Reseller.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reseller.any_instance.stub(:save).and_return(false)
        put :update, {:id => reseller.to_param, :reseller => { "name" => "invalid value" }}, valid_session
        assigns(:reseller).should eq(reseller)
      end

      it "re-renders the 'edit' template" do
        reseller = Reseller.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Reseller.any_instance.stub(:save).and_return(false)
        put :update, {:id => reseller.to_param, :reseller => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested reseller" do
      reseller = Reseller.create! valid_attributes
      expect {
        delete :destroy, {:id => reseller.to_param}, valid_session
      }.to change(Reseller, :count).by(-1)
    end

    it "redirects to the resellers list" do
      reseller = Reseller.create! valid_attributes
      delete :destroy, {:id => reseller.to_param}, valid_session
      response.should redirect_to(resellers_path)
    end
  end

end
