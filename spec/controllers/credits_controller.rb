require 'rails_helper'

RSpec.describe CreditsController, type: :controller do
  let(:user) { create(:user) }
  before do
    login user
  end
  context "クレジットカードを持っているユーザのテスト" do
    before do 
      user.credits << create(:credit, user_id: user.id)
    end 
    context "indexアクション(クレジットカード一覧画面)にアクセスした時", payjp: true do
      before do
        # テストでpayjpと通信が走らないように、たくさんモック化する
        payjp_customer = double("Payjp::Customer")
        payjp_list = double("Payjp::ListObject")
        payjp_card = double("Payjp::Card")
        allow(Payjp::Customer).to receive(:create).and_return(payjp_customer)
        allow(payjp_customer).to receive(:cards).and_return(payjp_list) # customer.cardsというメソッドがきたらpayjp_listというモックを返す
        allow(payjp_list).to receive(:retrieve).and_return(payjp_card) # customer.cards.retrieve()というメソッドがきたらpayjp_cardというモックを返す
        allow(payjp_card).to receive_messages(brand: "Visa", last4: "4242", exp_month: 2, exp_year: 2024) # card.brand、card.last4等のメソッドがきたらそれぞれ値を返す
        allow(payjp_customer).to receive(:default_card).and_return(true) # customer.default_cardというメソッドがきたらなんでもいいので適当に返す(その後のメソッドで使用しないため適当でOK)
      end
      it "@card_infoという変数が定義されていること" do
        test_card_info = {
          brand: "visa.svg",
          last4: "************4242",
          exp_date: "2/24"
        }
        get :index
        # factoryから作成されたデータで実行される実際のコントローラ@card_infoと
        # テストで作成したtest_card_infoが一致するかを検証する
        expect(assigns(:card_info)).to eq(test_card_info)
      end
      it "indexの画面が表示されること" do
        get :index
        expect(response).to render_template("index")
      end
    end
    context "newアクション(クレジットカード新規登録)にアクセスした時", payjp: true do
      it "userに紐づいているカードが存在するので、カード一覧画面にリダイレクトすること" do
        get :new
        expect(response).to redirect_to credits_path
      end
    end
    context "createアクションにアクセスした時" do
      before do
        payjp_customer = double("Payjp::Customer")
        payjp_list = double("Payjp::ListObject")
        payjp_card = double("Payjp::Card")
        allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) # Payjp::Customer.retrieve()というメソッドがきたらpayjp_customerというモックを返す
        allow(payjp_customer).to receive(:cards).and_return(payjp_list) # customer.cardsというメソッドがきたらpayjp_listというモックを返す
        allow(payjp_list).to receive(:retrieve).and_return(payjp_card) # customer.cards.retrieve()というメソッドがきたらpayjp_cardというモックを返す
        allow(payjp_card).to receive_messages(brand: "Visa", last4: "4242", exp_month: 2, exp_year: 2024) # card.brand、card.last4等のメソッドがきたらそれぞれ値を返す
        allow(payjp_customer).to receive(:default_card).and_return(true) # customer.default_cardというメソッドがきたらなんでもいいので適当に返す(その後のメソッドで使用しないため適当でOK)
      end
      it "credits_pathにリダイレクトされること" do
        post :create, params: {token: "cus_xxxxxxxxxxxxx"}
        expect(response).to redirect_to(credits_path)
      end
    end
    context "destroyアクションにアクセスした時" do
      before {
        payjp_customer = double("Payjp::Customer")
        allow(Payjp::Customer).to receive(:retrieve).and_return(payjp_customer) # Payjp::Customer.retrieve()というメソッドがきたらpayjp_customerというモックを返す
        allow(payjp_customer).to receive(:delete).and_return(true) # Payjp::Customer.retrieve()というメソッドがきたらpayjp_customerというモックを返す
      }
      it "indexアクションにリダイレクトされる事" do
        delete :destroy
        expect(response).to redirect_to(credits_path)
      end 
    end
  end
  context "クレジットカードを持っていないユーザのテスト" do
    context "newアクション(クレジットカード新規登録)にアクセスした時", payjp: true do
      it "userに紐づいているカードが存在しないので、新規登録画面が表示されること" do
        get :new
        expect(response).to render_template("new")
      end
    end
    context "createアクションにアクセスした時" do
      before do
        payjp_customer = double("Payjp::Customer")
        payjp_list = double("Payjp::ListObject")
        payjp_card = double("Payjp::Card")
        allow(Payjp::Customer).to receive(:create).and_return(payjp_customer) # Payjp::Customer.retrieve()というメソッドがきたらpayjp_customerというモックを返す
        allow(payjp_customer).to receive(:cards).and_return(payjp_list) # customer.cardsというメソッドがきたらpayjp_listというモックを返す
        allow(payjp_list).to receive(:create).and_return(payjp_card) # customer.cards.retrieve()というメソッドがきたらpayjp_cardというモックを返す
        allow(payjp_customer).to receive(:id).and_return("cus_xxxxxxxxxxxxx") # customer.cards.retrieve()というメソッドがきたらpayjp_cardというモックを返す
      end
      it "@creditが定義されていること" do
        post :create, params: {token: "tok_xxxxxxxx"}
        credit = create(:credit, user_id: user.id, customer_id: "cus_xxxxxxxxxxxxx")
        expect(assigns(:credit).customer_id).to eq(credit.customer_id)
      end
    end
  end
end
