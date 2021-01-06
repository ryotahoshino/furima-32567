FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    detail {"この商品の詳細"}
    price {810}
    state_id{1}
    burden_id{1}
    category_id{1}
    day_id{1}
    origin_id{1}
    association :user
  end
end