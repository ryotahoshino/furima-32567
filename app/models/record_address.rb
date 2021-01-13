class RecordAddress
  include ActiveModel::Model
  attr_accessor  :zip_code, :urban_id, :city, :address, :building, :telephone_number, :user_id, :item_id, :token
  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号にはハイフンありの7桁である必要があること'}
    validates :urban_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号はハイフンなしの11桁いないである必要がある'}
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create!(zip_code: zip_code, urban_id: urban_id, city: city, address: address, building: building, telephone_number: telephone_number, record_id: record.id)
  end
end
