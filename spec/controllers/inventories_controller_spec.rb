require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  let(:vendor) { create(:user, role: :vendor) }
  let(:customer) { create(:user, role: :customer) }
  let!(:pizza) { create(:pizza, quantity: 5) }
  let!(:crust) { create(:crust, quantity: 3) }
  let!(:topping) { create(:topping, quantity: 8) }
  let!(:side_item) { create(:side_item, quantity: 2) }

  before do
    sign_in vendor # Ensuring vendor is signed in
  end

  describe "GET #index" do
    context "when user is a vendor" do
      it "renders the index template and assigns products" do
        get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:pizzas)).to include(pizza)
        expect(assigns(:crusts)).to include(crust)
        expect(assigns(:toppings)).to include(topping)
        expect(assigns(:side_items)).to include(side_item)
      end
    end

    context "when user is a customer" do
      before do
        sign_out vendor
        sign_in customer
      end

      it "redirects to root path with an alert" do
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Access Denied!")
      end
    end
  end

  describe "GET #edit" do
    it "assigns the correct product based on type" do
      get :edit, params: { id: pizza.id, product_type: "pizza" }
      expect(assigns(:product)).to eq(pizza)
      expect(assigns(:product_type)).to eq("pizza")
      expect(response).to have_http_status(:success)
    end
  end
end
