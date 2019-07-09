FactoryBot.define do
  factory :item do
    name {"testitem"}
    description {"testtesttesttesttest"}
    status {"新品"}
    delivery_burden {"送料込み(出品者負担)"}
    delivery_method {"らくらくメルカリ便"}
    delivery_prefecture {"1"}
    delivery_time {"3~4日"}
    price {"100000"}
  end
end
