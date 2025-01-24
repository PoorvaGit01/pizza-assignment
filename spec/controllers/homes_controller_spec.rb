require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  let(:user) { create(:user) }
  let(:veg_category) { create(:category, name: "Vegetarian") }
  let(:non_veg_category) { create(:category, name: "Non-Vegetarian") }
  let!(:veg_pizza) { create(:pizza, category: veg_category, quantity: 5) }
  let!(:non_veg_pizza) { create(:pizza, category: non_veg_category, quantity: 3) }
  let!(:crust) { create(:crust, quantity: 4) }
  let!(:side_item) { create(:side_item, quantity: 2) }
  let!(:topping) { create(:topping, quantity: 6) }

  describe "GET #index" do
    context "when user is not authenticated" do
      it "redirects to sign-in page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is authenticated" do
      before do
        sign_in user
        get :index
      end

      it "renders the index template" do
        expect(response).to render_template(:index)
      end

      it "assigns @veg_category correctly" do
        expect(assigns(:veg_category)).to eq(veg_category)
      end

      it "assigns @non_veg_category correctly" do
        expect(assigns(:non_veg_category)).to eq(non_veg_category)
      end

      it "assigns available vegetarian pizzas" do
        expect(assigns(:veg_pizza)).to include(veg_pizza)
      end

      it "assigns available non-vegetarian pizzas" do
        expect(assigns(:non_veg_pizza)).to include(non_veg_pizza)
      end

      it "assigns available crusts" do
        expect(assigns(:crusts)).to include(crust)
      end

      it "assigns available side items" do
        expect(assigns(:side_items)).to include(side_item)
      end

      it "assigns available toppings" do
        expect(assigns(:topping)).to include(topping)
      end
    end
  end
end
