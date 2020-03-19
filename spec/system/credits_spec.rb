require 'rails_helper'

RSpec.describe "Credits", type: :system, js: false, focus: true do
  context 'ログインしている時' do
    let(:item) { create(:item) }
    let(:user) { create(:user) }
    before :each do
      sign_in user
    end

    context 'カード登録してる時' do
      it 'カード登録済みのユーザーは購入ボタンを押せる' do
        create(:credit, user: user)
        visit new_item_buy_history_path(item)
      end

    end
    context 'カード登録してない時' do
      it 'カード未登録のユーザーは購入ボタンを押せない' do
        visit new_item_buy_history_path(item)
        expect(page).to have_selector '.disable_buy_btn', text: '購入する'
      end
    end
  end
  context 'ログインしていない時' do

  end
end
