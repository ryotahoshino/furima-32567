class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  password_valid = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: password_valid
  # validates :password, format: { with: /\A(?=.?[a-z])(?=.?\d)[a-z\d]+\z/i }
  # validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数字のみ使えます"}
  has_many :items
  has_many :records
end
