FactoryBot.define do
  factory :record_address do
    zip_code {'852-8043'}
    urban_id {3}
    city {'長崎市'}
    address {'17-18'}
    building {'建物'}
    telephone_number {'08038972408'}
    token {"sampletoken123456"}
  end
end