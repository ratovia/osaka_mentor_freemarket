FactoryBot.define do
  factory :product do
    name  { Faker::Games::Zelda.item }
    price { Faker::Number.within(range: 300..9_999_999) }
    description { Faker::Lorem.sentence }
    condition { '新品、未使用' }
    delivery_burden { '送料込み(出品者負担)' }
    delivery_method { '未定' }
    delivery_time { '1~2日で発送' }
    status { :on_sale }
    seller
    prefecture_id { rand(1..47) }
    product_category_id { 159 }
    size_id { 3 }
    brand_id { 1 }

    after(:build) do |product|
      product.images << build(:image)
    end
  end
end
