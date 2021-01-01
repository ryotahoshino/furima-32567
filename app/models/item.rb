class Item < ApplicationRecord
  validates :name, presence: true
  validates :detail, presence: true
  validates :price, presence: true
  validates :user, presence: true
  validates :state_id, presence: true
  validates :burden_id, presence: true
  validates :origin_id, presence: true
  validates :day_id, presence: true
  validates :category_id, presence: true
  belongs_to :user
  has_one :record
  has_one_attached :image
end
