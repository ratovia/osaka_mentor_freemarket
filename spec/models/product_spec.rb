require 'rails_helper'

RSpec.describe Product, type: :model, focus: true do
  context 'validation' do
    context 'can save' do
      it 'ファクトリーの値を使って保存できる' do
        product = build(:product)
        expect(product).to be_valid
      end
      it '画像が10枚で保存できる' do
        product = build(:product)
        build_list(:image, 9, product: product)
        expect(product).to be_valid
      end
      it 'size_groupの無いカテゴリではsizeが未入力で保存できる' do
        product = build(:product, product_category_id: 232, size: nil) #「ソックス」のID
        expect(product).to be_valid
      end
    end

    context 'can not save' do
      it '画像が0枚だと保存できない' do
        product = build(:product)
        build_list(:image, 10, product: product)
        product.valid?
        expect(product.errors[:images]).to_not include('は最大10枚までです')
      end
      it '画像が11枚だと保存できない' do
        product = build(:product)
        product.images = []
        product.valid?
        expect(product.errors[:images]).to_not include('を1つ以上選択してください')
      end
      it 'size_groupのあるカテゴリでsizeが未入力だと保存できない' do
        product = build(:product, product_category_id: 219, size: nil) #「ハイヒール/パンプス」のID
        product.valid?
        expect(product.errors[:size]).to include('を入力してください')
      end
    end
  end
end
