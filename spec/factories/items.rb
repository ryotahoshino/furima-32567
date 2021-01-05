FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    detail {"この商品の詳細"}
    price {810}
    state_id{"---"}
    burden_id{"---"}
    category_id{"---"}
    day_id{"---"}
    origin_id{"---"}
    association :user
  end
end