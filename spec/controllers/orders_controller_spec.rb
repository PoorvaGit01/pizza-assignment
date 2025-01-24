require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:customer) { create(:user, role: :customer) }
  let(:vendor) { create(:user, role: :vendor) }
  let!(:pizza) { create(:pizza, quantity: 10) }
  let!(:crust) { create(:crust, quantity: 5) }
  let!(:side_item) { create(:side_item, quantity: 3, price: 100) }
  let!(:topping) { create(:topping, quantity: 4, price:100) }
  let!(:order) { create(:order, user: customer, pizza: pizza, crust: crust, quantity: 1, status: "ordered") }

  before do
    sign_in customer
  end

  describe "GET #index" do
    context "when user is a vendor" do
      before do
        sign_out customer
        sign_in vendor
      end

      it "assigns all non-pending orders for vendors" do
        get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:orders)).to include(order)
      end
    end

    context "when user is a customer" do
      it "assigns customer's non-pending orders" do
        get :index
        expect(response).to have_http_status(:success)
        expect(assigns(:orders)).to include(order)
      end
    end
  end

  describe "GET #new" do
    context "when customer is signed in" do
      it "assigns the correct pizza and available items" do
        get :new, params: { pizza_id: pizza.id }
        expect(assigns(:pizza)).to eq(pizza)
        expect(assigns(:crusts)).to include(crust)
        expect(assigns(:side_items)).to include(side_item)
        expect(response).to have_http_status(:success)
      end
    end

    context "when vendor tries to access" do
      before do
        sign_out customer
        sign_in vendor
      end

      it "redirects to root path with alert" do
        get :new, params: { pizza_id: pizza.id }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Access Denied!")
      end
    end
  end

  describe "POST #create" do
    context "with valid order parameters" do
      it "creates a new order and redirects" do
        expect {
          post :create, params: { order: { pizza_id: pizza.id, crust_id: crust.id,topping_ids:[topping.id], quantity: 2, size: "medium" } }
        }.to change(Order, :count).by(1)

        expect(response).to redirect_to(order_path(assigns(:order)))
        expect(flash[:notice]).to eq("Order placed successfully!")
      end
    end
  end

  describe "GET #show" do
    it "assigns the requested order" do
      get :show, params: { id: order.id }
      expect(assigns(:order)).to eq(order)
      expect(assigns(:order_items)).to eq(order.order_items)
      expect(response).to have_http_status(:success)
    end
  end
end
