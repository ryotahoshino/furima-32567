FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    detail {"この商品の詳細"}
    price {"810"}
    user {current_user.id}
    state_id {ItemId.all.sample}
    burden_id {ItemId.all.sample}
    origin_id {ItemId.all.sample}
    day_id {ItemId.all.sample}
    category_id {Itme.all.sample}
  end
end
