FactoryBot.define do
  factory :item do
    name { "アイテム" }
    description { "商品説明欄" }
    status { "新品" }
    delivery_burden { "送料込み(出品者負担)" }
    delivery_method { "らくらくメルカリ便" }
    delivery_prefecture { "1" }
    delivery_time { "3~4日" }
    price { "100000" }
    user_id  {"1"}

    after(:build) do |item|
      parent = FactoryBot.create(:category, name: "メンズ", category_id: nil)
      child = FactoryBot.create(:category, name: "アウター", category_id: parent.id)
      grand_child = FactoryBot.create(:category, name: "T-シャツ", category_id: child.id)
      item.category_id = grand_child.id
      item.images.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
