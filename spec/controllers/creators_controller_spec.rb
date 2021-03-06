require 'rails_helper'

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

RSpec.describe CreatorsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Creator. As you add validations to Creator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CreatorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all creators as @creators" do
      creator = Creator.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:creators)).to eq([creator])
    end
  end

  describe "GET #show" do
    it "assigns the requested creator as @creator" do
      creator = Creator.create! valid_attributes
      get :show, {:id => creator.to_param}, valid_session
      expect(assigns(:creator)).to eq(creator)
    end
  end

  describe "GET #new" do
    it "assigns a new creator as @creator" do
      get :new, {}, valid_session
      expect(assigns(:creator)).to be_a_new(Creator)
    end
  end

  describe "GET #edit" do
    it "assigns the requested creator as @creator" do
      creator = Creator.create! valid_attributes
      get :edit, {:id => creator.to_param}, valid_session
      expect(assigns(:creator)).to eq(creator)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Creator" do
        expect {
          post :create, {:creator => valid_attributes}, valid_session
        }.to change(Creator, :count).by(1)
      end

      it "assigns a newly created creator as @creator" do
        post :create, {:creator => valid_attributes}, valid_session
        expect(assigns(:creator)).to be_a(Creator)
        expect(assigns(:creator)).to be_persisted
      end

      it "redirects to the created creator" do
        post :create, {:creator => valid_attributes}, valid_session
        expect(response).to redirect_to(Creator.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved creator as @creator" do
        post :create, {:creator => invalid_attributes}, valid_session
        expect(assigns(:creator)).to be_a_new(Creator)
      end

      it "re-renders the 'new' template" do
        post :create, {:creator => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested creator" do
        creator = Creator.create! valid_attributes
        put :update, {:id => creator.to_param, :creator => new_attributes}, valid_session
        creator.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested creator as @creator" do
        creator = Creator.create! valid_attributes
        put :update, {:id => creator.to_param, :creator => valid_attributes}, valid_session
        expect(assigns(:creator)).to eq(creator)
      end

      it "redirects to the creator" do
        creator = Creator.create! valid_attributes
        put :update, {:id => creator.to_param, :creator => valid_attributes}, valid_session
        expect(response).to redirect_to(creator)
      end
    end

    context "with invalid params" do
      it "assigns the creator as @creator" do
        creator = Creator.create! valid_attributes
        put :update, {:id => creator.to_param, :creator => invalid_attributes}, valid_session
        expect(assigns(:creator)).to eq(creator)
      end

      it "re-renders the 'edit' template" do
        creator = Creator.create! valid_attributes
        put :update, {:id => creator.to_param, :creator => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested creator" do
      creator = Creator.create! valid_attributes
      expect {
        delete :destroy, {:id => creator.to_param}, valid_session
      }.to change(Creator, :count).by(-1)
    end

    it "redirects to the creators list" do
      creator = Creator.create! valid_attributes
      delete :destroy, {:id => creator.to_param}, valid_session
      expect(response).to redirect_to(creators_url)
    end
  end

end
