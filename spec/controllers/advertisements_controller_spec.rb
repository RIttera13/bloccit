require 'rails_helper'
include RandomData
RSpec.describe AdvertisementsController, type: :controller do
  let (:advertisement) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      body: RandomData.random_paragraph,
      price: 10
    )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [advertisements] to @advertisements" do
      get :index
      expect(assigns(:advertisements)).to eq([advertisement])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show, {id: advertisement.id}
      expect(response).to render_template :show
    end

    it "assigns advertisement to @advertisement" do
      get :show, {id: advertisement.id}
      expect(assigns(:advertisement)).to eq(advertisement)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, {id: advertisement.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @advertisement" do
      get :new
      expect(assigns(:advertisement)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases the number of advertisements by 1" do
      expect{post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10}}.to change(Advertisement,:count).by(1)
    end

    it "assigns the advertisement to @advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10}
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it "redirects to the new advertisement" do
      post :create, advertisement: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 10}
      expect(response).to redirect_to Advertisement.last
    end
  end
end
