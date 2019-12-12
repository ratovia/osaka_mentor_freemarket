require 'rails_helper'

describe "Item" do
  before do
    @item = build(:item)
  end

  describe "valid" do
    it "商品名, 商品説明, 商品の状態, 配送料の負担, 配送の方法, 発送元の地域, 発送元の地域, 発送までの日数, 価格を入力すれば出品できる" do
      item = build(:item)
      expect(item).to be_valid
    end
  end

  describe "invalid" do
    it "商品名が空の時出品できない" do
      item = build(
        :item,
        name: ""
      )
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "価格が空の時出品できない" do
      item = build(
        :item,
        price: ""
      )
      item.valid?
      expect(item.errors[:price]).to include("を入力してください", "は数値で入力してください")
    end

    it "商品の状態が空の時出品できない" do
      item = build(
        :item,
        status: ""
      )
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "商品名が41文字以上の時に出品できない" do
      item = build(
        :item,
        name: "アイテム" * 41
      )
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "商品説明が1000文字以上の時に出品できない" do
      item = build(
        :item,
        description: "商品説明欄" * 201
      )
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "価格が数値でない場合は出品できない" do
      item = build(
        :item,
        price: "ああああ"
      )
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "価格が300円未満の場合できない" do
      item = build(
        :item,
        price: "299"
      )
      item.valid?
      expect(item.errors[:price]).to include("は300以上の値にしてください")
    end
    it "価格が9,999,999円を超える場合出品できない" do
      item = build(
        :item,
        price: "10000000"
      )
      item.valid?
      expect(item.errors[:price]).to include("は9999999以下の値にしてください")
    end
  end
end
