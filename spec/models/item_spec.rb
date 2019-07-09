require 'rails_helper'

describe "Item" do
  before do
    @item = build(:item)
  end

  describe "valid" do
    it "商品名, 商品説明, 商品の状態, 配送料の負担, 配送の方法, 発送元の地域, 発送元の地域, 発送までの日数, 価格を入力すれば出品できる" do
      item = Item.new(
        name: "アイテム",
        description: "商品説明欄",
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "100000"
      )
      expect(item).to be_valid
    end
  end
  
  describe "invalid" do
    it "商品名が空の時出品できない" do
      item = Item.new(
        name: "",
        description: "商品説明欄",
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "100000"
      )
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "価格が空の時出品できない" do
      item = Item.new(
        name: "アイテム",
        description: "商品説明欄",
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: ""
      )
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "商品の状態が空の時出品できない" do
      item = Item.new(
        name: "アイテム",
        description: "商品説明欄",
        status: "",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "100000"
      )
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    it "商品名が41文字以上の時に出品できない" do
      item = Item.new(
        name: "アイテム" * 41,
        description: "商品説明欄",
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "100000"
      )
      item.valid?
      expect(item.errors[:name]).to include("is too long (maximum is 40 characters)")
    end

    it "商品説明が1000文字以上の時に出品できない" do
      item = Item.new(
        name: "アイテム",
        description: "商品説明欄" * 201,
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "100000"
      )
      item.valid?
      expect(item.errors[:description]).to include("is too long (maximum is 1000 characters)")
    end

    it "価格が数値でない場合は出品できない" do
      item = Item.new(
        name: "アイテム",
        description: "商品説明欄",
        status: "新品",
        delivery_burden: "送料込み(出品者負担)",
        delivery_method: "らくらくメルカリ便",
        delivery_prefecture: "1",
        delivery_time: "3~4日",
        price: "ああああ"
      )
      item.valid?
      expect(item.errors[:price]).to include("is not a number")
    end

    it "価格が300円未満の場合できない" do
    item = Item.new(
      name: "アイテム",
      description: "商品説明欄",
      status: "新品",
      delivery_burden: "送料込み(出品者負担)",
      delivery_method: "らくらくメルカリ便",
      delivery_prefecture: "1",
      delivery_time: "3~4日",
      price: "299"
    )
    item.valid?
    expect(item.errors[:price]).to include("must be greater than or equal to 300")
    end
    it "価格が9,999,999円を超える場合出品できない" do
      item = Item.new(
      name: "アイテム",
      description: "商品説明欄",
      status: "新品",
      delivery_burden: "送料込み(出品者負担)",
      delivery_method: "らくらくメルカリ便",
      delivery_prefecture: "1",
      delivery_time: "3~4日",
      price: "10000000"
    )
    item.valid?
    expect(item.errors[:price]).to include("must be less than or equal to 9999999")
    end
  end
end
