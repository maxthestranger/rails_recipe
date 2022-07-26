require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/foods", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Food. As you add validations to Food, be sure to
  # adjust the attributes here as well.
  let(:user) { User.create!(name: 'Max') }
  let(:valid_attributes) {
    {
      name: "test food",
      measurement_unit: "grams",
      price: "9.99",
      quantity: "9.99",
      user: user
    }
  }

  let(:invalid_attributes) {
    {
      name: nil,
      measurement_unit: nil,
      price: nil,
      quantity: nil,
      user: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Food.create! valid_attributes
      get foods_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_food_url
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Food" do
        expect {
          post foods_url, params: { food: valid_attributes }
        }.to change(Food, :count).by(1)
      end

      it "redirects to the created food" do
        post foods_url, params: { food: valid_attributes }
        expect(response).to redirect_to(foods_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Food" do
        expect {
          post foods_url, params: { food: invalid_attributes }
        }.to change(Food, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post foods_url, params: { food: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested food" do
      food = Food.create! valid_attributes
      expect {
        delete food_url(food)
      }.to change(Food, :count).by(-1)
    end

    it "redirects to the foods list" do
      food = Food.create! valid_attributes
      delete food_url(food)
      expect(response).to redirect_to(foods_url)
    end
  end
end
