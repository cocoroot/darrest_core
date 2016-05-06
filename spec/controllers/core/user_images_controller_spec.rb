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

RSpec.describe Core::UserImagesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Core::UserImage. As you add validations to Core::UserImage, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Core::UserImagesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all core_user_images as @core_user_images" do
      user_image = Core::UserImage.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:core_user_images)).to eq([user_image])
    end
  end

  describe "GET #show" do
    it "assigns the requested core_user_image as @core_user_image" do
      user_image = Core::UserImage.create! valid_attributes
      get :show, {:id => user_image.to_param}, valid_session
      expect(assigns(:core_user_image)).to eq(user_image)
    end
  end

  describe "GET #new" do
    it "assigns a new core_user_image as @core_user_image" do
      get :new, {}, valid_session
      expect(assigns(:core_user_image)).to be_a_new(Core::UserImage)
    end
  end

  describe "GET #edit" do
    it "assigns the requested core_user_image as @core_user_image" do
      user_image = Core::UserImage.create! valid_attributes
      get :edit, {:id => user_image.to_param}, valid_session
      expect(assigns(:core_user_image)).to eq(user_image)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Core::UserImage" do
        expect {
          post :create, {:core_user_image => valid_attributes}, valid_session
        }.to change(Core::UserImage, :count).by(1)
      end

      it "assigns a newly created core_user_image as @core_user_image" do
        post :create, {:core_user_image => valid_attributes}, valid_session
        expect(assigns(:core_user_image)).to be_a(Core::UserImage)
        expect(assigns(:core_user_image)).to be_persisted
      end

      it "redirects to the created core_user_image" do
        post :create, {:core_user_image => valid_attributes}, valid_session
        expect(response).to redirect_to(Core::UserImage.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved core_user_image as @core_user_image" do
        post :create, {:core_user_image => invalid_attributes}, valid_session
        expect(assigns(:core_user_image)).to be_a_new(Core::UserImage)
      end

      it "re-renders the 'new' template" do
        post :create, {:core_user_image => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested core_user_image" do
        user_image = Core::UserImage.create! valid_attributes
        put :update, {:id => user_image.to_param, :core_user_image => new_attributes}, valid_session
        user_image.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested core_user_image as @core_user_image" do
        user_image = Core::UserImage.create! valid_attributes
        put :update, {:id => user_image.to_param, :core_user_image => valid_attributes}, valid_session
        expect(assigns(:core_user_image)).to eq(user_image)
      end

      it "redirects to the core_user_image" do
        user_image = Core::UserImage.create! valid_attributes
        put :update, {:id => user_image.to_param, :core_user_image => valid_attributes}, valid_session
        expect(response).to redirect_to(user_image)
      end
    end

    context "with invalid params" do
      it "assigns the core_user_image as @core_user_image" do
        user_image = Core::UserImage.create! valid_attributes
        put :update, {:id => user_image.to_param, :core_user_image => invalid_attributes}, valid_session
        expect(assigns(:core_user_image)).to eq(user_image)
      end

      it "re-renders the 'edit' template" do
        user_image = Core::UserImage.create! valid_attributes
        put :update, {:id => user_image.to_param, :core_user_image => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested core_user_image" do
      user_image = Core::UserImage.create! valid_attributes
      expect {
        delete :destroy, {:id => user_image.to_param}, valid_session
      }.to change(Core::UserImage, :count).by(-1)
    end

    it "redirects to the core_user_images list" do
      user_image = Core::UserImage.create! valid_attributes
      delete :destroy, {:id => user_image.to_param}, valid_session
      expect(response).to redirect_to(core_user_images_url)
    end
  end

end
