class UserDonation
  include ActiveModel::Model
  attr_accessor :nickname, :zip_code, :urban_id, :city, :address, :building, :telephone_number, :record

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  password_valid = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: password_valid

  with_options presence: true do
    validates :zip_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号にはハイフンありの7桁である必要があること'}
    validates :urban_id
    validates :city
    validates :addresses
    validates :building
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: '電話番号はハイフンなしの11桁いないである必要がある'}
  end

  def save
    user = User.create(nickname: nickname)
    Address.create(zip_code: zip_code, urban_id: urban_id, city: city, address: address, building: building, telephone_number: telephone_number)
    Record.create(user: user, item: item)
  end
end
